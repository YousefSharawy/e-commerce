import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/feature/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 300,
      splash: Lottie.asset(AssetsManager.splash),
      duration: 3100,
      nextScreen: LoginScreen(),
    );
  }
}
