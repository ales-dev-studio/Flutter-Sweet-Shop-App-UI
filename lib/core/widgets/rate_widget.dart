import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

import '../gen/assets.gen.dart';
import '../theme/dimens.dart';
import 'app_svg_viewer.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate, this.textColor});

  final String rate;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.smallPadding,
      children: [
        AppSvgViewer(
          Assets.icons.starFilled,
          color: context.theme.appColors.primary,
          width: 16,
        ),
        Text(rate, style: TextStyle(color: textColor, fontSize: 12)),
      ],
    );
  }
}
