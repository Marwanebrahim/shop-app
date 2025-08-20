import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ontap,
    required this.textWidget,
    required this.backgroundColor,
  });
  final Color backgroundColor;
  final VoidCallback ontap;
  final Widget textWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 160,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 15)],
        ),
        child: Center(child: textWidget),
      ),
    );
  }
}
