import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

import '../gen/assets.gen.dart';
import '../theme/dimens.dart';
import 'app_svg_viewer.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Dimens.largePadding),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: Dimens.smallPadding),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search for cakes, pastries, cheesecakes',
            hintStyle: TextStyle(color: colors.gray2, fontSize: 13),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.mediumPadding,
              ),
              child: AppSvgViewer(Assets.icons.searchNormal1),
            ),
          ),
        ),
      ),
    );
  }
}
