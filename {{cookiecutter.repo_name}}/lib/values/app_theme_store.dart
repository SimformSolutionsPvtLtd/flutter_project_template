import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_theme_store.g.dart';

class AppThemeStore = _AppThemeStore with _$AppThemeStore;

abstract class _AppThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.light;

  @action
  void changeTheme({bool isDarkMode = true}) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
