import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

class FiltersTitle extends StatelessWidget {
  const FiltersTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: Text(
        title,
        style: context.theme.appTypography.labelLarge.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
