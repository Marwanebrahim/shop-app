import 'package:flutter/material.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';
import 'package:shop_app/widgets/custom_alert_dialog.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController textController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColors.gradientBackGroundDecoration,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              width: 300,
              decoration: _boxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: AppTextStyle.bold22.copyWith(
                        color: AppColors.deepPurple,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "Sign in to ShopCraft",
                      style: AppTextStyle.regular14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Email", style: AppTextStyle.bold14),
                  CustomTextField(
                    hintText: "Enter your Email",
                    textController: textController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }

                      if (!value.contains('@')) {
                        return "Please include an '@' in the emain address";
                      }
                      return null;
                    },
                    hidden: false,
                  ),
                  SizedBox(height: 5),
                  Text("Password", style: AppTextStyle.bold14),

                  CustomTextField(
                    hintText: "Enter your password",
                    textController: passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    hidden: true,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      ontap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        _showAlertDialog(context);
                      },
                      textWidget: Text(
                        "Sign In",
                        style: AppTextStyle.bold16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      backgroundColor: AppColors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 15)],
    );
  }

  Future<dynamic> _showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: Text(
          "Welcome!",
          style: AppTextStyle.bold22.copyWith(color: AppColors.green),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Account sign-in successfully",
          style: AppTextStyle.bold18.copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
        ontap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        buttonText: Text(
          "close",
          style: AppTextStyle.regular16.copyWith(color: AppColors.white),
        ),
        buttonBachground: AppColors.green,
      ),
    );
  }
}
