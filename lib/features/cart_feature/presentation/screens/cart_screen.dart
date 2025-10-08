import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_button.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/bloc/cart_cubit.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/widgets/app_svg_viewer.dart';
import '../widgets/cart_list_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    final appColors = context.theme.appColors;
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: GeneralAppBar(title: 'My Cart', showBackIcon: false),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return Center(
                child: Column(
                  spacing: Dimens.largePadding,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgViewer(
                      Assets.icons.shoppingCart,
                      width: 50,
                      color: appColors.gray4,
                    ),
                    Text(
                      'Your cart is empty',
                      style: appTypography.bodyLarge.copyWith(
                        color: appColors.gray4,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(child: CartListWidget(items: state.items)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.largePadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: Dimens.largePadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:', style: appTypography.bodyLarge),
                          Text(
                            '\$${state.totalAmount.toStringAsFixed(2)}',
                            style: appTypography.bodyLarge.copyWith(
                              color: appColors.primary,
                            ),
                          ),
                        ],
                      ),
                      AppButton(
                        title: 'Proceed To Checkout',
                        onPressed: () {},
                        textStyle: appTypography.bodyLarge,
                        borderRadius: Dimens.corners,
                        margin: EdgeInsets.symmetric(
                          vertical: Dimens.largePadding,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
