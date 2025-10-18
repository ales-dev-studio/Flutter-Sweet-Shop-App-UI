import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/check_device_size.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/screens/home_screen.dart';

import '../../../../core/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      appPushReplacement(context, HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;
    return AppScaffold(
      backgroundColor: colors.brownExtraLight,
      padding: EdgeInsets.zero,
      safeAreaTop: false,
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.images.splashHeader.image(),
            Assets.images.logo.image(
              width: checkVerySmallDeviceSize(context) ? 290 : 390,
            ),
            SizedBox(height: Dimens.largePadding),
            Assets.images.cake.image(
              width: checkVerySmallDeviceSize(context) ? 205 : 305,
            ),
          ],
        ),
      ),
    );
  }
}
