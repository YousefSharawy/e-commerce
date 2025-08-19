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
 final int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.5),
            spreadRadius: 2.r,
            blurRadius: 5.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 343.w,
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(image, width: 75.w),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: FontSizeManager.s12,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text("$price\$"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
