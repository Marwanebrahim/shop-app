import 'package:easy_localization/easy_localization.dart';
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
                        "sign up1",
                        style: AppTextStyle.bold22.copyWith(
                          color: AppColors.deepPurple,
                          fontSize: 26,
                        ),
                      ).tr(),
                    ),

                    Center(
                      child: Text(
                        "sign up2",
                        style: AppTextStyle.regular14,
                      ).tr(),
                    ),
                    SizedBox(height: 5),
                    Text("sign up3", style: AppTextStyle.bold14).tr(),
                    CustomTextField(
                      hintText: "sign up4".tr(),
                      textController: fullNameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "sign up5".tr();
                        }

                        return null;
                      },
                      hidden: false,
                    ),
                    SizedBox(height: 5),

                    Text("sign up6", style: AppTextStyle.bold14).tr(),
                    CustomTextField(
                      hintText: "sign up7".tr(),
                      textController: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "sign up8".tr();
                        }

                        if (!value.contains('@')) {
                          return "sign up9".tr();
                        }
                        return null;
                      },
                      hidden: false,
                    ),
                    SizedBox(height: 10),
                    Text("sign up10", style: AppTextStyle.bold14).tr(),

                    CustomTextField(
                      hintText: "sign up11".tr(),
                      textController: passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "sign up12".tr();
                        }
                        if (value.length < 6) {
                          return "sign up13".tr();
                        }
                        return null;
                      },
                      hidden: true,
                    ),
                    SizedBox(height: 5),
                    Text("sign up14", style: AppTextStyle.bold14).tr(),

                    CustomTextField(
                      hintText: "sign up15".tr(),
                      textController: confirmPassController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "sign up16".tr();
                        }
                        if (confirmPassController.value !=
                            passController.value) {
                          return "sign up17".tr();
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
                          "sign up21".tr(),
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
          "sign up18".tr(),
          style: AppTextStyle.bold22.copyWith(color: AppColors.green),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "sign up19".tr(),
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
          "sign up20".tr(),
          style: AppTextStyle.regular16.copyWith(color: AppColors.white),
        ),
        buttonBachground: AppColors.green,
      ),
    );
  }
}
