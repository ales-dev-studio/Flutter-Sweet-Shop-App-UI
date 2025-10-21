import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_title_widget.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/rate_widget.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/screens/products_screen.dart';

import '../../../../core/theme/dimens.dart';
import '../../data/data_source/local/sample_data.dart';
import '../screens/product_details_screen.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titleOfTheListOfProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleWidget(
              title: titleOfTheListOfProducts[index],
              onPressed: () {
                appPush(context, ProductsScreen());
              },
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productsName.length,
                shrinkWrap: true,
                itemBuilder: (final context, final index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: Dimens.largePadding),
                    child: InkWell(
                      onTap: (){
                        appPush(context, ProductDetailsScreen());
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: SizedBox(
                        height: 100,
                        width: 196,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 196,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  productsImage[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 24,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: Dimens.largePadding,
                                    vertical: Dimens.padding,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.smallCorners,
                                    ),
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                  child: RateWidget(rate: '7.10'),
                                ),
                                Container(
                                  width: 196,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        context.theme.appColors.black.withValues(
                                          alpha: 0.4,
                                        ),
                                        context.theme.appColors.black.withValues(
                                          alpha: 0.7,
                                        ),
                                        context.theme.appColors.black.withValues(
                                          alpha: 0.8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      productsName[index],
                                      style: context
                                          .theme
                                          .appTypography
                                          .titleSmall
                                          .copyWith(
                                            color: context.theme.appColors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
