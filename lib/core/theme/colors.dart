import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // Primary colors
  final Color primary;
  final Color primaryShade1;
  final Color primaryShade2;
  final Color primaryShade3;
  final Color primaryShade4;
  final Color primaryShade5;
  final Color primaryTint1;
  final Color primaryTint2;
  final Color primaryTint3;
  final Color primaryTint4;
  final Color primaryTint5;

  // Secondary colors
  final Color secondary;
  final Color secondaryShade1;
  final Color secondaryShade2;
  final Color secondaryShade3;
  final Color secondaryShade4;
  final Color secondaryShade5;
  final Color secondaryTint1;
  final Color secondaryTint2;
  final Color secondaryTint3;
  final Color secondaryTint4;
  final Color secondaryTint5;

  // Neutral colors
  final Color white;
  final Color black;
  final Color gray;
  final Color gray2;
  final Color gray4;

  // Graphic colors
  final Color brown;
  final Color brownLight;
  final Color brownExtraLight;

  // Status colors
  final Color error;
  final Color errorLight;
  final Color errorExtraLight;
  final Color success;
  final Color successLight;
  final Color warning;
  final Color warningLight;

  const AppColors({
    // Primary
    required this.primary,
    required this.primaryShade1,
    required this.primaryShade2,
    required this.primaryShade3,
    required this.primaryShade4,
    required this.primaryShade5,
    required this.primaryTint1,
    required this.primaryTint2,
    required this.primaryTint3,
    required this.primaryTint4,
    required this.primaryTint5,
    // Secondary
    required this.secondary,
    required this.secondaryShade1,
    required this.secondaryShade2,
    required this.secondaryShade3,
    required this.secondaryShade4,
    required this.secondaryShade5,
    required this.secondaryTint1,
    required this.secondaryTint2,
    required this.secondaryTint3,
    required this.secondaryTint4,
    required this.secondaryTint5,
    // Neutral
    required this.white,
    required this.black,
    required this.gray,
    required this.gray2,
    required this.gray4,
    // Graphic
    required this.brown,
    required this.brownLight,
    required this.brownExtraLight,
    // Status
    required this.error,
    required this.errorLight,
    required this.errorExtraLight,
    required this.success,
    required this.successLight,
    required this.warning,
    required this.warningLight,
  });

  @override
  ThemeExtension<AppColors> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other,
      double t,
      ) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      // Primary
      primary: Color.lerp(primary, other.primary, t)!,
      primaryShade1: Color.lerp(primaryShade1, other.primaryShade1, t)!,
      primaryShade2: Color.lerp(primaryShade2, other.primaryShade2, t)!,
      primaryShade3: Color.lerp(primaryShade3, other.primaryShade3, t)!,
      primaryShade4: Color.lerp(primaryShade4, other.primaryShade4, t)!,
      primaryShade5: Color.lerp(primaryShade5, other.primaryShade5, t)!,
      primaryTint1: Color.lerp(primaryTint1, other.primaryTint1, t)!,
      primaryTint2: Color.lerp(primaryTint2, other.primaryTint2, t)!,
      primaryTint3: Color.lerp(primaryTint3, other.primaryTint3, t)!,
      primaryTint4: Color.lerp(primaryTint4, other.primaryTint4, t)!,
      primaryTint5: Color.lerp(primaryTint5, other.primaryTint5, t)!,
      // Secondary
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryShade1: Color.lerp(secondaryShade1, other.secondaryShade1, t)!,
      secondaryShade2: Color.lerp(secondaryShade2, other.secondaryShade2, t)!,
      secondaryShade3: Color.lerp(secondaryShade3, other.secondaryShade3, t)!,
      secondaryShade4: Color.lerp(secondaryShade4, other.secondaryShade4, t)!,
      secondaryShade5: Color.lerp(secondaryShade5, other.secondaryShade5, t)!,
      secondaryTint1: Color.lerp(secondaryTint1, other.secondaryTint1, t)!,
      secondaryTint2: Color.lerp(secondaryTint2, other.secondaryTint2, t)!,
      secondaryTint3: Color.lerp(secondaryTint3, other.secondaryTint3, t)!,
      secondaryTint4: Color.lerp(secondaryTint4, other.secondaryTint4, t)!,
      secondaryTint5: Color.lerp(secondaryTint5, other.secondaryTint5, t)!,
      // Neutral
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      gray2: Color.lerp(gray2, other.gray2, t)!,
      gray4: Color.lerp(gray4, other.gray4, t)!,
      // Graphic
      brown: Color.lerp(brown, other.brown, t)!,
      brownLight: Color.lerp(brownLight, other.brownLight, t)!,
      brownExtraLight: Color.lerp(brownExtraLight, other.brownExtraLight, t)!,
      // Status
      error: Color.lerp(error, other.error, t)!,
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      errorExtraLight: Color.lerp(errorExtraLight, other.errorExtraLight, t)!,
      success: Color.lerp(success, other.success, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
    );
  }
}