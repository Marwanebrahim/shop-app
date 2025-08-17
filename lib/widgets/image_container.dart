import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,

      width: 150,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow:[ BoxShadow(
          blurRadius: 10,
          color: AppColors.black
        )],
        image: DecorationImage(image: AssetImage(imagePath,),fit: BoxFit.fill)
      ),

      
    );
  }
}