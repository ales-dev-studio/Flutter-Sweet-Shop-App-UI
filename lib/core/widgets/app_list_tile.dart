import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../theme/dimens.dart';
import 'app_svg_viewer.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingIconPath,
    this.trailing,
    this.padding,
  });

  final GestureTapCallback onTap;
  final String title;
  final String leadingIconPath;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: Ink(
        height: 51,
        child: ListTile(
          onTap: onTap,
          title: Text(title, style: TextStyle(fontSize: 15)),
          leading: AppSvgViewer(leadingIconPath, width: 19),
          trailing:
              trailing ?? AppSvgViewer(Assets.icons.arrowRight4, width: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.corners),
          ),
        ),
      ),
    );
  }
}
