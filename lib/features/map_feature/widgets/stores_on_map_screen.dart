import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/widgets/app_svg_viewer.dart';

class StoresOnMapScreen extends StatelessWidget {
  const StoresOnMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    final List<String> titles = [
      'Sweets Craze',
      'Urban Delights',
      'The Gilded Tart',
      'Velvet Crumb',
      'Marie\'s Tea Room',
      'The Dancing Scone',
      'The Jolly Croissant',
    ];
    return Container(
      height: 226,
      margin: EdgeInsets.only(bottom: Dimens.largePadding),
      child: ListView.builder(
        itemCount: titles.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (final context, final index) {
          return Container(
            width: 266,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.corners),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            margin: EdgeInsets.only(left: Dimens.largePadding),
            child: Column(
              spacing: Dimens.padding,
              children: [
                if (index.isEven)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.corners),
                    child: Assets.images.mapImg1.image(
                      width: 266,
                      height: 96,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                else
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.corners),
                    child: Assets.images.mapImg2.image(
                      width: 266,
                      height: 96,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding),
                  child: Column(
                    spacing: Dimens.padding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: Dimens.smallPadding,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(titles[index], style: appTypography.bodyLarge),
                          Text('cake, Cupcakes, donuts, sweets'),
                        ],
                      ),
                      SizedBox.shrink(),
                      AppDivider(),
                      Row(
                        spacing: Dimens.padding,
                        children: [
                          AppSvgViewer(
                            Assets.icons.location,
                            color: appColors.primary,
                            width: 14,
                            height: 14,
                          ),
                          Text(
                            '93 Worth St, New York, NY 10013',
                            style: appTypography.caption,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        spacing: Dimens.padding,
                        children: [
                          AppSvgViewer(
                            Assets.icons.clock,
                            color: appColors.primary,
                            width: 14,
                            height: 14,
                          ),
                          Text(
                            '15 min, 1.8km, Free Delivery',
                            style: appTypography.caption,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
