import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';

import '../../../../core/theme/dimens.dart';
import '../../../home_feature/data/data_source/local/sample_data.dart';

class OrdersListForCheckout extends StatelessWidget {
  const OrdersListForCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return ListView.separated(
      itemCount: categoryProductsImage.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.veryLargePadding,
          ),
          child: Row(
            spacing: Dimens.largePadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 95,
                width: 95,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Image.asset(
                    categoryProductsImage[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        'Sponge donut',
                        style: context.theme.appTypography.bodyLarge.copyWith(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          spacing: Dimens.largePadding,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity: ${index + 3} pcs',
                              style: context.theme.appTypography.labelMedium
                                  .copyWith(color: appColors.gray4),
                            ),
                            Text(
                              '\$${index + 1}8.00',
                              style: context.theme.appTypography.bodyLarge,
                            ),
                          ],
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
      separatorBuilder: (final context, final index) {
        return AppDivider();
      },
    );
  }
}
