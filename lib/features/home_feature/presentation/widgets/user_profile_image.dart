import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

import '../../../../core/theme/dimens.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.hasBorder = true,
    this.defaultIconPadding = Dimens.veryLargePadding,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final bool hasBorder;
  final double defaultIconPadding;

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    return Container(
      width: width ?? 120,
      height: height ?? 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border:
        hasBorder ? Border.all(width: 2, color: appColor.primary) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
