import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({
    required this.price,
    required this.image,
    required this.title,
    this.count = 0,
    this.rate = 0,
    this.id = 0,
    this.description = "",
    super.key,
  });
  final String image;
  final String title;
  final String description;
  final double price;
  final int id;
  final int count;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 148.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.gray.withOpacity(0.05),
                  ColorManager.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.gray.withOpacity(0.5),
                  spreadRadius: 2.r,
                  blurRadius: 5.r,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 148.w,
            height: 184.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Image.network(image, fit: BoxFit.fill),
          ),
                    SizedBox(height: 4.h),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: FontSizeManager.s16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: Text(
              "$price\$",
              style: TextStyle(
                fontSize: FontSizeManager.s16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: Text(
              rate == 0 ? "No reviews" : "$rate/5⭐",
              style: TextStyle(
                fontSize: FontSizeManager.s16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
