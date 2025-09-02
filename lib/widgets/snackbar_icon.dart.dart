import 'package:flutter/material.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';

class SnackbarIcon extends StatelessWidget {
  const SnackbarIcon({super.key, required this.itemName});
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 15,
      top: 15,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.deepPurple,
        child: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text("Item added to cart", style: AppTextStyle.bold20.copyWith(color: AppColors.black)),
                    Text(
                      "$itemName has been added to your cart",
                      style: AppTextStyle.regular14.copyWith(color: AppColors.black),
                    ),
                  ],
                ),
                backgroundColor: AppColors.white,
              ),
            );
          },
          icon: Icon(Icons.shopping_cart_outlined ,color: AppColors.white,size: 25,),
        ),
      ),
    );
  }
}
