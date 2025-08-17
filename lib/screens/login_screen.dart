import 'package:flutter/material.dart';
import 'package:shop_app/helpers/local_assets_helper.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/image_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: AppColors.gradientBackGroundDecoration,
        ),

        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "ShopCraft",
              style: AppTextStyle.bold22.copyWith(
                color: AppColors.white,
                fontSize: 30,
              ),
            ),
            Text(
              "Your Premium Shopping Experience",
              style: AppTextStyle.regular14.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageContainer(imagePath: LocalAssetsHelper.firstAsset),
                ImageContainer(imagePath: LocalAssetsHelper.sixthAsset),
              ],
            ),
            SizedBox(height: 0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(ontap: () {

              },
               textButton: "Sign Up"),
               CustomButton(ontap: () {
                 
               }, textButton: "Sign In")
               ],

            ),
          ],
        ),
      ),
    );
  }
}
