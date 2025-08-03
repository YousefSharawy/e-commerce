import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/feature/auth/representation/screens/login_screen.dart';
import 'package:e_commerce/feature/auth/representation/screens/register_screen.dart';
import 'package:e_commerce/feature/auth/representation/screens/vendor_register_screen.dart';
import 'package:e_commerce/splash_screen.dart';
import 'package:e_commerce/feature/users/home_screen.dart';
import 'package:e_commerce/feature/vendors/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/feature/admin/admin_home_screen.dart'; // Add this line

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.vendorRegisterScreen:
        return MaterialPageRoute(builder: (_) => VendorRegisterScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      case Routes.vendorHomeScreen:
        return MaterialPageRoute(builder: (_) => VendorHomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
