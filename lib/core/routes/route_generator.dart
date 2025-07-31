import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/feature/auth/login/login_screen.dart';
import 'package:e_commerce/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
