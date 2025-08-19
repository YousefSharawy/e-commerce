import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  TextEditingController nameEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // Dispose controllers when the widget is destroyed
    emailEditingController.dispose();
    passwordEditingController.dispose();
    nameEditingController.dispose();
    super.dispose();
  }

  void clearControllers() {
    emailEditingController.clear();
    passwordEditingController.clear();
    nameEditingController.clear();
    formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterError) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(state.message);
          clearControllers();
        } else if (state is RegisterLoading) {
          UiUtils.showLoading(context);
        } else if (state is RegisterSuccess) {
          UiUtils.hideLoading(context);
          UiUtils.hideLoading(context);
          UiUtils.showMessage("Account created");
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: ColorManager.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: FontSizeManager.s24,
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.black,
                  ),
                ),
                SizedBox(height: 73.h),

                CustomeTextField(
                  label: Text(
                    "Name",
                    style: TextStyle(color: ColorManager.gray),
                  ),
                  textEditingController: nameEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),

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
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Already Have an account? ",
                      style: TextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorManager.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                CustomTextButton(
                  onButtonPressed: userRegister,
                  label: 'SIGN UP',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void userRegister() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(context).registerAsUser(
        emailEditingController.text,
        nameEditingController.text,

        passwordEditingController.text,
      );
    }
  }
}
