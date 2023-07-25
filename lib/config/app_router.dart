
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/auth/signin_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/intro_screen.dart';
import '../screens/product/product_detail.dart';
import '../screens/splash/splash_screen.dart';

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
