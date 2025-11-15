import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';

import '../../../../core/theme/dimens.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/data_source/local/sample_data.dart';

enum OrderType { active, completed, canceled }

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({super.key, required this.orderType});

  final OrderType orderType;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return ListView.separated(
      itemCount: categoryProductsImage.length,
      itemBuilder: (final context, final index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
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
                        style: context.theme.appTypography.bodyLarge,
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
                              '\$ ${index + 1}8.00',
                              style: context.theme.appTypography.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 110,
                          height: 32,
                          child: AppButton(
                            title:
                                orderType == OrderType.active
                                    ? 'Track order'
                                    : orderType == OrderType.completed
                                    ? 'Delivered'
                                    : 'Order again',
                            color:
                                orderType == OrderType.active
                                    ? appColors.primary
                                    : orderType == OrderType.completed
                                    ? appColors.successLight
                                    : appColors.error,
                            margin: EdgeInsets.zero,
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: Dimens.padding),
                            ),
                            onPressed: () {},
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
      separatorBuilder: (final context, final index) {
        return AppDivider(height: 0);
      },
    );
  }
}
