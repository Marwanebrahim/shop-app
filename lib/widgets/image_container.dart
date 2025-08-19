import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.black)],
        image: DecorationImage(
          image: imagePath.startsWith("http")
              ? NetworkImage(imagePath)
              : AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
