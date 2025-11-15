import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/check_theme_status.dart';

import '../../data/models/cart_item_model.dart';
import '../bloc/cart_cubit.dart';

class CartActions extends StatelessWidget {
  const CartActions({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    final cartCubit = context.read<CartCubit>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: Dimens.largePadding,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: appColors.gray2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () => cartCubit.decrementQuantity(item.product.id),
            borderRadius: BorderRadius.circular(4),
            child: Icon(
              Icons.remove,
              size: 16,
              color: checkDarkMode(context) ? appColors.black : appColors.white,
            ),
          ),
        ),
        Text(item.quantity.toString(), style: appTypography.bodyLarge),
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () => cartCubit.incrementQuantity(item.product.id),
            borderRadius: BorderRadius.circular(4),
            child: Icon(Icons.add, size: 16, color: appColors.white),
          ),
        ),
      ],
    );
  }
}
