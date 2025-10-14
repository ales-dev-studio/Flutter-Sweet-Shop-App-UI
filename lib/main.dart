import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/data_source/local/fake_products.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/bloc/cart_cubit.dart';
import 'core/theme/theme.dart';
import 'features/home_feature/presentation/screens/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocProvider(
      create:
          (context) =>
              CartCubit()
                ..loadCart()
                ..addItem(FakeProducts.products[0])
                ..addItem(FakeProducts.products[1])
                ..addItem(FakeProducts.products[4])
                ..addItem(FakeProducts.products[6]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        home: SplashScreen(),
      ),
    );
  }
}
