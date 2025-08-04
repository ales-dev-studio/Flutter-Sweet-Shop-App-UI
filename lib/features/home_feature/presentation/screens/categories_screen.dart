import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/rate_widget.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_title_widget.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../../data/data_source/local/sample_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Categories'),
      padding: EdgeInsets.zero,
      body: ListView.separated(
        itemCount: titlesOfCategories.length,
        shrinkWrap: true,
        itemBuilder: (final context, final index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleWidget(
                thumbnailPath: imagesOfCategories[index],
                title: titlesOfCategories[index],
                onPressed: () {},
              ),
              SizedBox(
                height: 264,
                child: ListView.builder(
                  itemCount: categoryProductsImage.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (final context, final index) {
                    return Container(
                      width: 138,
                      height: 243,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.largePadding,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.theme.appColors.black.withValues(
                              alpha: 0.1,
                            ),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: Dimens.largePadding,
                        top: Dimens.smallPadding,
                        bottom: Dimens.smallPadding,
                      ),
                      child: Column(
                        spacing: Dimens.padding,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 110,
                            width: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.corners,
                              ),
                              child: Image.asset(
                                categoryProductsImage[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.smallPadding,
                              ),
                              child: Center(
                                child: Text(
                                  categoryProductsName[index],
                                  style: context.theme.appTypography.labelMedium
                                      .copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RateWidget(rate: '7.10'),
                              Text(
                                '1K+ Review',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${index + 1}8.00',
                            style: context.theme.appTypography.labelLarge
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                            height: 32,
                            child: AppButton(
                              title: 'Add to Cart',
                              onPressed: () {},
                              margin: EdgeInsets.zero,
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                  horizontal: Dimens.padding,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (final context, final index) {
          return SizedBox(height: Dimens.largePadding);
        },
      ),
    );
  }
}
