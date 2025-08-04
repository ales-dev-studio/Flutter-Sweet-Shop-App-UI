import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/screens/special_offers.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/banner_slider_widget.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/products_list.dart';

import '../../../../../core/widgets/app_title_widget.dart';
import '../categories_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTitleWidget(
            onPressed: () {
              appPush(context, SpecialOffers());
            },
            title: 'Special offers',
          ),
          BannerSliderWidget(),
          AppTitleWidget(onPressed: () {}, title: 'Categories'),
          CategoriesList(),
          ProductsList(),
          SizedBox(height: Dimens.largePadding),
        ],
      ),
    );
  }
}
