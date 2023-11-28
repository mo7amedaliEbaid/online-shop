import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../auth/auth_bloc/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.unauthenticated) {
          Timer(Duration(seconds: 2),
              () => Navigator.pushNamed(context, '/intro'));
        }

        if (state.status == AuthStatus.authenticated) {
          Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  Colors.black45,
                  kPrimaryColor,
                  kRedColor
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              )),
            ),
            Center(
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
                width: 300,
                height: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
