import 'package:flutter/material.dart';
import 'package:shop_app/helpers/network_assets_helper.dart';
import 'package:shop_app/styles/app_colors.dart';
import 'package:shop_app/styles/app_text_style.dart';
import 'package:shop_app/widgets/hot_offers_list_view.dart';
import 'package:shop_app/widgets/items_list.dart';
import 'package:shop_app/widgets/page_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Our Products",
          style: AppTextStyle.bold22.copyWith(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: _getFlexibleSpace(),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          Center(child: Text("Featured Products", style: AppTextStyle.bold22)),
          SizedBox(height: 15),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 10)],
            ),
            child: PageViewWidget(pageController: pageController),
          ),
          SizedBox(height: 15),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: NetworkAssetsHelper.getNetworkImage.length,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.deepPurple,
              ),
            ),
          ),
          SizedBox(height: 15),

          Center(
            child: Text("Shop Our Collection", style: AppTextStyle.bold22),
          ),
          SizedBox(height: 10),
          ItemsList(),
          Center(child: Text("Hot Offers 🔥", style: AppTextStyle.bold22)),
          SizedBox(height: 10,),
          HotOffersListView()
        ],
      ),
    );
  }

  Container _getFlexibleSpace() {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.gradientAppBarDecoration),
    );
  }
}
