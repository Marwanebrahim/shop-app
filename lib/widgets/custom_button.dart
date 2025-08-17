import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.ontap, required this.textButton, });
  final String textButton;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(
            color: AppColors.black,
            blurRadius: 15
          )]
        ),
        child: Center(child: Text(textButton,style: AppTextStyle.regular20.copyWith(color: AppColors.deepPurple),)),
      ),
    );
  }
}