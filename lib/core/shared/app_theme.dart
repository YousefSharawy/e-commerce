import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.gray,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 24),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorManager.primary,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    ),
    colorScheme: ColorScheme.fromSeed(
      onSurface: ColorManager.black,

      seedColor: ColorManager.black,
      primary: ColorManager.black,
    ),
  );
}
