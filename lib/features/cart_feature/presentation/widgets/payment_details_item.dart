import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

import '../../../../core/theme/dimens.dart';

class PaymentDetailsItem extends StatelessWidget {
  const PaymentDetailsItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.largePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: appColors.gray4)),
          Text(subtitle),
        ],
      ),
    );
  }
}
