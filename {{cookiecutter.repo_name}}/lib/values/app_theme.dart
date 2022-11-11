import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  static AppTheme get instance => _instance;

  ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: AppColors.colorPrimary,
      colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.colorAccent),
      unselectedWidgetColor: AppColors.colorPrimary,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData.dark();
  }
}
