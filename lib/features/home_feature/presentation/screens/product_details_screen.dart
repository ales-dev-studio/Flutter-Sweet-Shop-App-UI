import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/sized_context.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_button.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_choice_chip.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_icon_buttons.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_read_more_text.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/rate_widget.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/user_profile_image.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../cart_feature/data/data_source/local/fake_products.dart';
import '../../../cart_feature/data/models/product_model.dart';
import '../../../cart_feature/presentation/bloc/cart_cubit.dart';
import '../../data/data_source/local/sample_data.dart';
import '../widgets/product_details_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _selectedWeight = weights[4];

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    return AppScaffold(
      safeAreaTop: false,
      safeAreaBottom: false,
      padding: EdgeInsets.zero,
      body: SizedBox(
        height: context.heightPx,
        child: Stack(
          children: [
            Assets.images.bigCake.image(
              width: context.widthPx,
              fit: BoxFit.fitWidth,
            ),
            ProductDetailsAppBar(),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 140,
                      color: appColor.primary,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.largePadding,
                            vertical: Dimens.padding,
                          ),
                          child: SizedBox(
                            width:
                                (context.widthPx < Dimens.largeDeviceBreakPoint
                                    ? context.widthPx
                                    : Dimens.mediumDeviceBreakPoint) -
                                32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$50.00',
                                  style: appTypography.bodyLarge.copyWith(
                                    color: appColor.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  width: 222,
                                  child: AppButton(
                                    margin: EdgeInsets.zero,
                                    title: 'Add to cart',
                                    onPressed: _addToCart,
                                    borderRadius: Dimens.corners,
                                    color: appColor.white,
                                    textStyle: appTypography.bodyLarge.copyWith(
                                      color: appColor.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    iconColor: appColor.primary,
                                    iconPath: Assets.icons.shoppingCart,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: context.heightPx * 0.4,
                    margin: EdgeInsets.only(bottom: 112),
                    width:
                        context.widthPx < Dimens.largeDeviceBreakPoint
                            ? context.widthPx
                            : Dimens.mediumDeviceBreakPoint,
                    decoration: BoxDecoration(
                      color: context.theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(Dimens.corners * 2),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(Dimens.largePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chocolate Cake',
                                style: appTypography.bodyLarge.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              RateWidget(rate: '9.10'),
                            ],
                          ),
                          SizedBox(height: Dimens.largePadding),
                          AppReadMoreText(productDescription),
                          SizedBox(height: Dimens.padding),
                          Divider(height: Dimens.largePadding),
                          Text(
                            'Seller',
                            style: appTypography.bodyLarge.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SizedBox(
                              width: 44,
                              height: 44,
                              child: UserProfileImage(
                                imagePath: Assets.images.profileImage.path,
                              ),
                            ),
                            title: Text(
                              'Luna Fisher',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                top: Dimens.padding,
                              ),
                              child: Text('Cake'),
                            ),
                            trailing: AppIconButton(
                              iconPath: Assets.icons.call,
                              onPressed: () {},
                              iconColor: appColor.primary,
                              backgroundColor: appColor.primary.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ),
                          Divider(height: 0),
                          SizedBox(height: Dimens.padding),
                          Text(
                            'Select Weight',
                            style: appTypography.bodyLarge.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: Dimens.padding),
                          Wrap(
                            spacing: Dimens.largePadding,
                            children:
                                weights.map((weight) {
                                  final isSelected = _selectedWeight == weight;
                                  return AppChoiceChip(
                                    label: weight,
                                    selected: isSelected,
                                    onSelected: (selected) {
                                      setState(() {
                                        _selectedWeight = weight;
                                      });
                                    },
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart() {
    final cartCubit = context.read<CartCubit>();
    final ProductModel product = FakeProducts.products[Random().nextInt(7)];
    cartCubit.addItem(product);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${product.name} added to cart!')));
  }
}
