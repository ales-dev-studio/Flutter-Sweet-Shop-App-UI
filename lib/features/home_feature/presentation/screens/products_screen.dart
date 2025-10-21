import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/sized_context.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_search_bar.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/rate_widget.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/widgets/app_icon_buttons.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../../../../core/widgets/shaded_container.dart';
import '../../data/data_source/local/sample_data.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return AppScaffold(
      appBar: GeneralAppBar(
        title: 'Products',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimens.largePadding,
              right: Dimens.largePadding,
            ),
            child: AppSearchBar(),
          ),
        ),
        height: 128,
      ),
      body: Column(
        spacing: Dimens.largePadding,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: Dimens.largePadding,
            children: [
              ShadedContainer(
                padding: EdgeInsets.all(Dimens.largePadding),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text('Filters')],
                ),
              ),
              ShadedContainer(
                padding: EdgeInsets.all(Dimens.largePadding),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text('Sort')],
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimens.largePadding,
                crossAxisSpacing: Dimens.largePadding,
                mainAxisExtent: 210,
              ),
              shrinkWrap: true,
              itemCount: categoryProductsImage.length,
              itemBuilder: (final context, final index) {
                return ShadedContainer(
                  child: Column(
                    spacing: Dimens.padding,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Dimens.padding),
                        child: SizedBox(
                          height: 114,
                          width: context.widthPx,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimens.corners),
                            child: Image.asset(
                              categoryProductsImage[index],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding,
                        ),
                        child: Column(
                          spacing: Dimens.largePadding,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: Dimens.padding,
                              children: [
                                Expanded(
                                  child: Text(
                                    categoryProductsName[index],
                                    style:
                                        context.theme.appTypography.titleSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                RateWidget(rate: '7.10'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${index + 1}8.00',
                                  style: context.theme.appTypography.labelLarge
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: AppIconButton(
                                    iconPath: Assets.icons.shoppingCart,
                                    backgroundColor: appColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
