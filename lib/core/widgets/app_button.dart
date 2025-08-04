import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/sized_context.dart';

import '../theme/dimens.dart';
import 'app_svg_viewer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.width,
    this.iconPath,
    this.margin,
    this.borderRadius,
    this.padding,
  });

  final String title;
  final GestureTapCallback? onPressed;
  final Color? color;
  final double? width;
  final String? iconPath;
  final EdgeInsets? margin;
  final double? borderRadius;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  @override
  Widget build(final BuildContext context) {
    final colors = context.theme.appColors;
    return Container(
      width: width ?? context.widthPx,
      height: 54.0,
      margin: margin ?? const EdgeInsets.all(Dimens.largePadding),
      child: FilledButton(
        style: ButtonStyle(
          padding: padding,
          backgroundColor:
              color == null
                  ? (WidgetStateProperty.resolveWith<Color>((
                    final Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.disabled)) {
                      return colors.primary.withValues(alpha: 0.3);
                    }
                    return colors.primary;
                  }))
                  : WidgetStateProperty.all<Color>(color!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? Dimens.smallCorners,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              AppSvgViewer(iconPath ?? '', color: colors.white),
              const SizedBox(width: Dimens.largePadding),
            ],
            Text(title),
          ],
        ),
      ),
    );
  }
}
