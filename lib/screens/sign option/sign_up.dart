import 'package:flutter/material.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';
import 'package:shop_app/widgets/custom_alert_dialog.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
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
              height: 600,
              width: 300,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Center(
                      child: Text(
                        "Create Account",
                        style: AppTextStyle.bold22.copyWith(
                          color: AppColors.deepPurple,
                          fontSize: 26,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "Join ShopCraft today",
                        style: AppTextStyle.regular14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Full Name", style: AppTextStyle.bold14),
                    CustomTextField(
                      hintText: "Enter your full name",
                      textController: fullNameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Full name is required";
                        }

                        return null;
                      },
                      hidden: false,
                    ),
                    SizedBox(height: 5),

                    Text("Email", style: AppTextStyle.bold14),
                    CustomTextField(
                      hintText: "Enter your Email",
                      textController: emailController,
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 5),
                    Text("Confirm Password", style: AppTextStyle.bold14),

                    CustomTextField(
                      hintText: "Confirm your password",
                      textController: confirmPassController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (confirmPassController.value !=
                            passController.value) {
                          return "Passwords do not match";
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
                          "Create Account",
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
      ),
    );
  }

  Future<dynamic> _showAlertDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CustomAlertDialog(
        title: Text(
          "Success!",
          style: AppTextStyle.bold22.copyWith(color: AppColors.green),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Account created successfully",
          style: AppTextStyle.bold18.copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
        ontap: () {
          Navigator.pushReplacement(
            context,
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
