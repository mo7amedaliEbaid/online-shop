
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../modules/auth/auth_screens/signin_screen.dart';
import '../modules/auth/auth_screens/signup_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/home/intro_screen.dart';
import '../modules/splash/splash_screen.dart';

import '../modules/products/products_screens/product_detail.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/splash':
        return SplashScreen.route();
      case '/login':
        return LoginPage.route();
      case '/intro':
        return IntroScreen.route();
      case '/sign-up':
        return SignUpPage.route();
      case '/product-Detail':
        return ProductDetail.route(product: settings.arguments as Product);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
    );
  }
}
