import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/data/data_source/local/sample_data.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: titlesOfCategories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (final context, final index) {
          return Column(
            spacing: Dimens.padding,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: context.theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(Dimens.largePadding),
                margin: EdgeInsets.symmetric(
                  horizontal: index == 0 ? Dimens.largePadding : Dimens.padding,
                ),
                child: Center(child: Image.asset(imagesOfCategories[index])),
              ),
              Text(titlesOfCategories[index]),
            ],
          );
        },
      ),
    );
  }
}
