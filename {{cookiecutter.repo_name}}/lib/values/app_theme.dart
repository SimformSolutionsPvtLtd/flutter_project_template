import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static const AppTheme instance = AppTheme._();

  ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: AppColors.colorPrimary,
      colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.colorAccent),
      unselectedWidgetColor: AppColors.colorPrimary,
    );
  }

  ThemeData getDarkTheme() => ThemeData.dark();
}
