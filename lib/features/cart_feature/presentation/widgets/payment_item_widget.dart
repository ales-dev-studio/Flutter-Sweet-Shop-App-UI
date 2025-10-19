import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/bordered_container.dart';

import '../../../../core/widgets/app_svg_viewer.dart';

class PaymentItemWidget extends StatelessWidget {
  const PaymentItemWidget({
    super.key,
    this.onTap,
    required this.title,
    this.iconPath,
    this.logoPath,
    this.isActive = false,
    this.showBorder = true,
    this.showRadio = true,
  });

  final GestureTapCallback? onTap;

  final String title;
  final String? iconPath;
  final String? logoPath;
  final bool isActive;
  final bool showBorder;
  final bool showRadio;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimens.corners),
      child: BorderedContainer(
        borderColor: showBorder ? null : Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.only(
            left: showBorder ? Dimens.largePadding : Dimens.padding,
          ),
          leading:
              iconPath != null
                  ? AppSvgViewer(iconPath!, color: appColors.primary)
                  : logoPath != null
                  ? AppSvgViewer(logoPath!, width: 26, height: 26)
                  : null,
          title: Text(title, style: appTypography.bodyMedium),
          trailing:
              showRadio
                  ? Radio(
                    value: isActive,
                    groupValue: true,
                    onChanged: (final value) {},
                    activeColor: appColors.primary,
                  )
                  : null,
        ),
      ),
    );
  }
}
