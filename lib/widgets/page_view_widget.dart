import 'package:flutter/material.dart';
import 'package:shop_app/helpers/network_assets_helper.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key, required this.pageController});

  final PageController pageController;
  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemCount: NetworkAssetsHelper.getNetworkImage.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    NetworkAssetsHelper.getNetworkImage[index],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Positioned(
              bottom: 15,
              left: 15,
              child: Text(
                NetworkAssetsHelper.getImageText[index],
                style: AppTextStyle.bold20.copyWith(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
