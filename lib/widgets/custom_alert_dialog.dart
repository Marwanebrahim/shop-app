import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/widgets/custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.ontap,
    required this.buttonText,
    required this.buttonBachground,
  });
  final Widget title;
  final Widget content;
  final VoidCallback ontap;
  final Widget buttonText;
  final Color buttonBachground;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      backgroundColor: AppColors.white,
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      title: title,
      content: content,
      actions: [
        CustomButton(
          ontap: ontap,
          textWidget: buttonText,
          backgroundColor: buttonBachground,
        ),
      ],
    );
  }
}
