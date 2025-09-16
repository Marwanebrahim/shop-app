import 'package:easy_localization/easy_localization.dart';
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
                    Text(
                      "snack bar1",
                      style: AppTextStyle.bold20.copyWith(
                        color: AppColors.black,
                      ),
                    ).tr(),
                    Row(
                      children: [
                        Text(
                          "$itemName ",
                          style: AppTextStyle.regular14.copyWith(
                            color: AppColors.black,fontSize: 12
                          ),
                        ).tr(),
                        Text(
                          "snack bar2",
                          style: AppTextStyle.regular14.copyWith(
                            color: AppColors.black,fontSize: 12
                          ),
                        ).tr(),
                      ],
                    ),
                  ],
                ),
                backgroundColor: AppColors.white,
              ),
            );
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
