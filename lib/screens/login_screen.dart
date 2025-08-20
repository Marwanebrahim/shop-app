import 'package:flutter/material.dart';
import 'package:shop_app/helpers/local_assets_helper.dart';
import 'package:shop_app/helpers/network_assets_helper.dart';
import 'package:shop_app/screens/sign%20option/sign_in.dart';
import 'package:shop_app/screens/sign%20option/sign_up.dart';
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
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "ShopCraft",
              style: AppTextStyle.bold22.copyWith(
                color: AppColors.white,
                fontSize: 40,
              ),
            ),
            Text(
              "Your Premium Shopping Experience",
              style: AppTextStyle.regular14.copyWith(color: AppColors.white),
            ),
            // SizedBox(height: 5),
            ImageContainer(imagePath: LocalAssetsHelper.firstAsset),
            ImageContainer(imagePath: NetworkAssetsHelper.firstNetworkImage),
            SizedBox(height: 5),
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  ontap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  textWidget: Text(
                    "Sign up",
                    style: AppTextStyle.regular20.copyWith(
                      color: AppColors.deepPurple,
                    ),
                  ),
                  backgroundColor: AppColors.white,
                ),
                CustomButton(
                  ontap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  textWidget: Text(
                    "Sign In",
                    style: AppTextStyle.regular20.copyWith(
                      color: AppColors.deepPurple,
                    ),
                  ),
                  backgroundColor: AppColors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
