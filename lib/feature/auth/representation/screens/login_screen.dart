import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_validator.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/widgets/custom_container.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/core/widgets/custome_text_field.dart';
import 'package:e_commerce/feature/auth/representation/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/representation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // Dispose controllers when the widget is destroyed
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  void clearControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
    formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessUser) {
          UiUtils.hideLoading(context);
          Navigator.pushReplacementNamed(context, Routes.userScreens);
        } else if (state is LoginSuccessVendor) {
          UiUtils.hideLoading(context);
          Navigator.pushReplacementNamed(context, Routes.vendorHomeScreen);
        } else if (state is LoginSuccessAdmin) {
          UiUtils.hideLoading(context);
          Navigator.pushReplacementNamed(context, Routes.adminHomeScreen);
        } else if (state is LoginError) {
          UiUtils.hideLoading(context);
          clearControllers();
          UiUtils.showMessage(state.message);
        } else if (state is LoginLoading) {
          UiUtils.showLoading(context);
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: FontSizeManager.s24,
                      fontWeight: FontWeightManager.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  SizedBox(height: 73.h),
                  CustomeTextField(
                    label: Text(
                      "Email",
                      style: TextStyle(color: ColorManager.gray),
                    ),
                    textEditingController: emailEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      } else if (!AppValidator.isEmail(value)) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),

                  CustomeTextField(
                    label: Text(
                      "Password",
                      style: TextStyle(color: ColorManager.gray),
                    ),
                    isPassword: true,
                    textEditingController: passwordEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.trim().length < 8) {
                        return "Password can't be less than 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.registerScreen);
                      },
                      child: Text(
                        "Don't have account?",
                        style: TextStyle(
                          fontSize: FontSizeManager.s14,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(
                          context,
                        ).pushNamed(Routes.vendorRegisterScreen);
                      },
                      child: Text(
                        "Create Vendor account?",
                        style: TextStyle(
                          fontSize: FontSizeManager.s14,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  CustomTextButton(onButtonPressed: login, label: 'LOGIN'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(
        context,
      ).userLogin(emailEditingController.text, passwordEditingController.text);
    }
  }
}
