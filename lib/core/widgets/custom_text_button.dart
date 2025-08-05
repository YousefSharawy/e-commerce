import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.onButtonPressed,
    required this.label,
  });
  final VoidCallback onButtonPressed;
  String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          elevation: 3,
        ),
        onPressed: onButtonPressed,
        child: Text(
          label,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s14,
          ),
        ),
      ),
    );
  }
}
