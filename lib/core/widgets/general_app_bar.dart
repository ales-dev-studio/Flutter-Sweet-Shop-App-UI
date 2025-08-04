import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';

import '../gen/assets.gen.dart';
import '../theme/dimens.dart';
import 'app_bordered_icon_button.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(title),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
        child: AppBorderedIconButton(
          iconPath: Assets.icons.arrowLeft,
          onPressed: () {
            appPop(context);
          },
        ),
      ),
      leadingWidth: 90.0,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + 16.0);
}
