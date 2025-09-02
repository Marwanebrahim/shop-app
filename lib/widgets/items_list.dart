import 'package:flutter/material.dart';
import 'package:shop_app/helpers/local_assets_helper.dart';
import 'package:shop_app/helpers/uri_helper.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';
import 'package:shop_app/widgets/snackbar_icon.dart.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: LocalAssetsHelper.mixedImages.length,
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 10)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Stack(
                children: [
                  Container(
                    height: 260,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            LocalAssetsHelper.mixedImages[index].startsWith(
                              "http",
                            )
                            ? NetworkImage(LocalAssetsHelper.mixedImages[index])
                            : AssetImage(LocalAssetsHelper.mixedImages[index])
                                  as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                 SnackbarIcon(itemName: UriHelper.imagesText[index],)
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  UriHelper.imagesText[index],
                  style: AppTextStyle.bold20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  UriHelper.imagesPrice[index],
                  style: AppTextStyle.bold18.copyWith(
                    color: AppColors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
