import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeTextField extends StatefulWidget {
  TextEditingController textEditingController;
  bool isPassword;
  Widget label;
  String? Function(String?)? validator;

  CustomeTextField({
    required this.label,
    required this.textEditingController,
    required this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  late bool isObsecure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 64.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 3.r, // How much the shadow spreads
            blurRadius: 3.r, // How blurred the shadow is
            offset: Offset(2, 4), // Shadow position (x, y)
          ),
        ],

        borderRadius: BorderRadius.circular(10.r),
        color: ColorManager.white,
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        style: TextStyle(color: ColorManager.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20.w, top: 14.h),
          label: widget.label,

          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.w, color: ColorManager.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.w, color: ColorManager.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.w, color: ColorManager.transparent),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  icon: Icon(
                    isObsecure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.gray,
                  ),
                )
              : null,
        ),
        controller: widget.textEditingController,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObsecure,
      ),
    );
  }
}
