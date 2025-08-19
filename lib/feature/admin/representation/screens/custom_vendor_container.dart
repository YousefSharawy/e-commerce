import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_cubit.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVendorContainer extends StatefulWidget {
  const CustomVendorContainer({
    required this.name,
    required this.email,
    required this.status,
    required this.onApprove,
    required this.onDeny,
    super.key,
  });
  final String name;
  final String email;
  final String status;
  final VoidCallback onApprove;
  final VoidCallback onDeny;

  @override
  State<CustomVendorContainer> createState() => _CustomVendorContainerState();
}

class _CustomVendorContainerState extends State<CustomVendorContainer> {
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: BlocBuilder<AdminCubit, AdminStates>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: FontSizeManager.s12,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                      widget.status == 'pending'
                          ? IconButton(
                              onPressed: widget.onDeny,
                              icon: Icon(
                                Icons.close,
                                color: ColorManager.primary,
                              ),
                            )
                          : widget.status == 'denied'
                          ? Text(
                              "denied",
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: FontSizeManager.s12,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.email,
                        style: TextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorManager.black,
                        ),
                      ),
                      widget.status == 'pending'
                          ? IconButton(
                              onPressed: widget.onApprove,
                              icon: Icon(
                                Icons.check,
                                color: const Color.fromARGB(255, 0, 112, 4),
                              ),
                            )
                          : widget.status == 'approved'
                          ? Text(
                              "approved",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 112, 4),
                                fontSize: FontSizeManager.s12,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
