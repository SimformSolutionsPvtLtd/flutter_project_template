import 'package:flutter/material.dart';
{%- if cookiecutter.is_theme_enable != false -%}
import 'package:flutter_mobx/flutter_mobx.dart';
{% endif %}

import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'services/snack_bar_messenger.dart';
{%- if cookiecutter.is_theme_enable != false -%}
import 'utils/extensions.dart';
import 'values/app_theme.dart';
import 'values/app_theme_store.dart';
{% endif %}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

class {{cookiecutter._app_class_name}}App extends StatelessWidget {
  const {{cookiecutter._app_class_name}}App({super.key});

  @override
  Widget build(BuildContext context) {
    {%- if cookiecutter.is_theme_enable != false -%}
    final themeStore = context.provide<AppThemeStore>();
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance.getLightTheme(),
          darkTheme: AppTheme.instance.getDarkTheme(),
          themeMode: themeStore.themeMode,
          home: const SplashScreen(),
          onGenerateRoute: Routes.generateRoute,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: SnackBarMessenger.key,
        );
      },
    );
    {% else %}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: SnackBarMessenger.key,
    );
    {% endif %}
  }
}
