import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/dimens.dart';
import '../utils/check_device_size.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.onDrawerChanged,
    this.drawer,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.safeAreaLeft = true,
    this.safeAreaTop = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = true,
    this.safeAreaMinimum = EdgeInsets.zero,
    this.safeAreaMaintainBottomViewPadding = false,
    this.padding,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.hasBottomSheetPadding = true,
  });

  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final DrawerCallback? onDrawerChanged;
  final Widget? drawer;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final DragStartBehavior drawerDragStartBehavior;
  final Widget? body;
  final bool safeAreaLeft;
  final bool safeAreaTop;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final EdgeInsets safeAreaMinimum;
  final bool safeAreaMaintainBottomViewPadding;
  final EdgeInsets? padding;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final bool hasBottomSheetPadding;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: SafeArea(
        left: safeAreaLeft,
        top: safeAreaTop,
        right: safeAreaRight,
        bottom: safeAreaBottom,
        minimum: safeAreaMinimum,
        maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
        child: Padding(
          padding:
              padding ??
              EdgeInsets.symmetric(
                horizontal:
                    checkVerySmallDeviceSize(context)
                        ? Dimens.padding
                        : Dimens.largePadding,
              ),
          child:
              checkDesktopSize(context)
                  ? Center(
                    child: SizedBox(
                      width: Dimens.mediumDeviceBreakPoint,
                      child: body,
                    ),
                  )
                  : body,
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
    );
  }
}
