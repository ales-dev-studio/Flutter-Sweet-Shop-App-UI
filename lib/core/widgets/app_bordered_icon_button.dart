import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

import 'app_svg_viewer.dart';

class AppBorderedIconButton extends StatelessWidget {
  const AppBorderedIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
  });

  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.appColors.gray2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: AppSvgViewer(iconPath, width: 25),
      ),
    );
  }
}
