import 'package:easy_localization/easy_localization.dart';
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
  void dispose() {
    textController.dispose();
    passController.dispose();
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
                      "sign in1",
                      style: AppTextStyle.bold22.copyWith(
                        color: AppColors.deepPurple,
                        fontSize: 26,
                      ),
                    ).tr(),
                  ),

                  Center(
                    child: Text("sign in2", style: AppTextStyle.regular14).tr(),
                  ),
                  SizedBox(height: 5),
                  Text("sign in3", style: AppTextStyle.bold14).tr(),
                  CustomTextField(
                    hintText: "sign in4".tr(),
                    textController: textController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "sign in5".tr();
                      }

                      if (!value.contains('@')) {
                        return "sign in6".tr();
                      }
                      return null;
                    },
                    hidden: false,
                  ),
                  SizedBox(height: 5),
                  Text("sign in7", style: AppTextStyle.bold14).tr(),

                  CustomTextField(
                    hintText: "sign in8".tr(),
                    textController: passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "sign in9".tr();
                      }
                      if (value.length < 6) {
                        return "sign in10".tr();
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
                        "sign in14".tr(),
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
      barrierDismissible: true,
      context: context,
      builder: (context) => CustomAlertDialog(
        title: Text(
          "sign in11".tr(),
          style: AppTextStyle.bold22.copyWith(color: AppColors.green),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "sign in12".tr(),
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
          "sign in13".tr(),
          style: AppTextStyle.regular16.copyWith(color: AppColors.white),
        ),
        buttonBachground: AppColors.green,
      ),
    );
  }
}
