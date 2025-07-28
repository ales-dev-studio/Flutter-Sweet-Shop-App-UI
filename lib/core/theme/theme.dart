import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/colors.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/typography.dart';

class AppTheme {
  //
  // Light theme
  //
  static final light = ThemeData.light().copyWith(
    extensions: [_lightAppColors, AppTypography.light],
    primaryColor: _lightAppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _lightAppColors.primary,
      brightness: Brightness.light,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _lightAppColors.white,
      labelTextStyle: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        final Color color =
            states.contains(WidgetState.selected)
                ? _lightAppColors.primary
                : _lightAppColors.black;
        return TextStyle(color: color);
      }),
    ),
    scaffoldBackgroundColor: _lightAppColors.white,
  );

  static const _lightAppColors = AppColors(
    // Primary
    primary: Color(0xFFFB5650),
    primaryShade1: Color(0xFFFEDDDC),
    primaryShade2: Color(0xFFFECCCA),
    primaryShade3: Color(0xFFFDBBB9),
    primaryShade4: Color(0xFFFD9A96),
    primaryShade5: Color(0xFFFC7873),
    primaryTint1: Color(0xFFD04540),
    primaryTint2: Color(0xFFA43430),
    primaryTint3: Color(0xFF792421),
    primaryTint4: Color(0xFF631B19),
    primaryTint5: Color(0xFF4D1311),

    // Secondary
    secondary: Color(0xFFFC645F),
    secondaryShade1: Color(0xFFFEE0DF),
    secondaryShade2: Color(0xFFFEBDCF),
    secondaryShade3: Color(0xFFFEC0BF),
    secondaryShade4: Color(0xFFFDA29F),
    secondaryShade5: Color(0xFFFD837F),
    secondaryTint1: Color(0xFFD4514C),
    secondaryTint2: Color(0xFFAB3D39),
    secondaryTint3: Color(0xFF832A27),
    secondaryTint4: Color(0xFF6F201D),
    secondaryTint5: Color(0xFF5A1614),

    // Neutral
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    gray: Color(0xFFEDEDED),
    gray2: Color(0xFFB5B5B5),
    gray4: Color(0xFF757575),

    // Graphic
    brown: Color(0xFF82422B),
    brownLight: Color(0xFF944F32),
    brownExtraLight: Color(0xFFFFCC99),

    // Status
    error: Color(0xFFFC3D3D),
    errorLight: Color(0xFFE00004),
    errorExtraLight: Color(0xFFFFE1E0),
    success: Color(0xFF4CAF50),
    successLight: Color(0xFFCDEBCD),
    warning: Color(0xFFFFCAAB),
    warningLight: Color(0xFFFDF3D7),
  );

  //
  // Dark theme
  //
  static final dark = ThemeData.dark().copyWith(
    extensions: [_darkAppColors, AppTypography.dark],
  );

  // Dark theme will be implemented later
  static const _darkAppColors = _lightAppColors;
}

extension ColorThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColors get appColors => extension<AppColors>()!;
}

extension FontThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appTypography;
  AppTypography get appTypography => extension<AppTypography>()!;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
