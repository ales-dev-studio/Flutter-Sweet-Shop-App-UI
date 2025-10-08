import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_svg_viewer.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/rate_widget.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/models/cart_item_model.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/bloc/cart_cubit.dart';

import '../../../../core/gen/assets.gen.dart';
import 'cart_actions.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key, required this.items});

  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    final appColors = context.theme.appColors;
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (final context, final index) {
        return Dismissible(
          key: Key(items[index].product.id.toString()),
          background: Container(
            color: appColors.error,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: AppSvgViewer(
              Assets.icons.trash,
              width: 28,
              height: 28,
              color: appColors.white,
            ),
          ),
          onDismissed: (final direction) {
            context.read<CartCubit>().removeItem(items[index].product.id);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.largePadding,
              vertical: Dimens.veryLargePadding,
            ),
            child: Row(
              spacing: Dimens.largePadding,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.shrink(),
                SizedBox(
                  height: 95,
                  width: 95,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.corners),
                    child: Image.asset(
                      items[index].product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: Dimens.largePadding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index].product.name,
                            style: appTypography.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          RateWidget(
                            rate: items[index].product.rate.toString(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              spacing: Dimens.largePadding,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${items[index].product.weight} kg',
                                  style: appTypography.labelMedium.copyWith(
                                    color: appColors.gray4,
                                  ),
                                ),
                                Text(
                                  '\$ ${items[index].product.price}',
                                  style: appTypography.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          CartActions(item: items[index]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (final context, final index) {
        return AppDivider();
      },
    );
  }
}
