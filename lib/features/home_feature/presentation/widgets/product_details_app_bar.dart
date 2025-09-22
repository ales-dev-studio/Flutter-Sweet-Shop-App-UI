import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_bordered_icon_button.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
        child: AppBorderedIconButton(
          iconPath: Assets.icons.arrowLeft,
          color: Colors.white,
          onPressed: () {
            appPop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
          child: AppBorderedIconButton(
            iconPath: Assets.icons.heart,
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
      leadingWidth: 90.0,
    );
  }
}
