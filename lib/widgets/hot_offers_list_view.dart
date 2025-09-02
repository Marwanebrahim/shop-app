import 'package:flutter/material.dart';
import 'package:shop_app/helpers/uri_helper.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';

class HotOffersListView extends StatelessWidget {
  const HotOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: UriHelper.mainText.length,
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 200,
          width: 300,
          decoration: _getBoxDecoration(),
          child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              spacing: 15,
            
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          UriHelper.mainText[index],
                          style: AppTextStyle.bold20,
                        ),
                        Text(
                          UriHelper.subText[index],
                          style: AppTextStyle.regular18,
                        ),
                      ],
                    ),
                  ),
                ),
            
                Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientBackGroundDecoration,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: AppColors.black, blurRadius: 10),
                    ],
                  ),
                  child: Center(child: Text(UriHelper.designedText[index] ,style: AppTextStyle.bold16.copyWith(color: AppColors.white),),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 10)],
    );
  }
}
