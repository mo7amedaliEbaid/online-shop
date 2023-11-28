import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_shop/core/dio.dart';


import 'core/app_router.dart';
import 'core/firebase_options.dart';
import 'modules/auth/auth_bloc/auth_bloc.dart';
import 'modules/auth/auth_repos/auth_repos.dart';
import 'modules/branches/branches_bloc/branch_bloc.dart';
import 'modules/branches/branches_repos/branch_repos.dart';
import 'modules/cart/cart_bloc/cart_bloc.dart';
import 'modules/products/product_bloc/product_bloc.dart';
import 'modules/products/product_repos/product_repos.dart';
import 'modules/splash/splash_screen.dart';
import 'modules/user/user_bloc/user_bloc.dart';
import 'modules/user/user_repos/user_repos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(firebaseFirestore: FirebaseFirestore.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(InitializeAuthEvent()),
          ),
          BlocProvider(
              create: (context) => CartBloc()..add(CartStarted())
          ),
          BlocProvider(
            create: (context) => BranchBloc(branchRepos: BranchRepos())
              ..add(LoadBranches()),
          ),
          BlocProvider(
            create: (context) =>
                ProductBloc(productRepos: ProductRepos())..add(LoadProducts()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => UserBloc(
              authBloc: context.read<AuthBloc>(),
              userRepository: context.read<UserRepository>(),
            )..add(StartUserEvent()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
