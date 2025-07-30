import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_svg_viewer.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/tabs/cart_tab.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/tabs/orders_tab.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/presentation/widgets/tabs/profile_tab.dart';

import '../../../../core/gen/assets.gen.dart';
import '../bloc/bottom_navigation_cubit.dart';
import '../widgets/tabs/home_tab.dart';
import '../widgets/tabs/map_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>(
      create: (context) => BottomNavigationCubit(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BottomNavigationCubit>();
    final read = context.read<BottomNavigationCubit>();
    final colors = context.theme.appColors;
    final List<Widget> tabs = [
      const HomeTab(),
      const CartTab(),
      const OrdersTab(),
      const MapTab(),
      const ProfileTab(),
    ];
    return AppScaffold(
      body: tabs[watch.state.selectedIndex],
      padding: EdgeInsets.zero,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: NavigationBar(
          selectedIndex: watch.state.selectedIndex,
          onDestinationSelected: (final int index) {
            read.onItemTap(index: index);
          },
          destinations: [
            NavigationDestination(
              icon: AppSvgViewer(Assets.icons.home2),
              selectedIcon: AppSvgViewer(
                Assets.icons.home2,
                color: colors.primary,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: AppSvgViewer(Assets.icons.shoppingCart),
              selectedIcon: AppSvgViewer(
                Assets.icons.shoppingCart,
                color: colors.primary,
              ),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: AppSvgViewer(Assets.icons.receipt),
              selectedIcon: AppSvgViewer(
                Assets.icons.receipt,
                color: colors.primary,
              ),
              label: 'Orders',
            ),
            NavigationDestination(
              icon: AppSvgViewer(Assets.icons.map1),
              selectedIcon: AppSvgViewer(
                Assets.icons.map1,
                color: colors.primary,
              ),
              label: 'Map',
            ),
            NavigationDestination(
              icon: AppSvgViewer(Assets.icons.user),
              selectedIcon: AppSvgViewer(
                Assets.icons.user,
                color: colors.primary,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
