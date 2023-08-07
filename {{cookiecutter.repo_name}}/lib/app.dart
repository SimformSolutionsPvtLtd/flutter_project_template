import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
{%- if cookiecutter.is_theme_enable != false -%}
import 'utils/extensions.dart';
import 'values/app_theme.dart';
import 'values/app_theme_store.dart';
{% endif %}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

// TODO(user): Change name of app as per Project
class App extends StatelessWidget {
  const App({super.key});

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
        );
      },
    );
    {% else %}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
    );
    {% endif %}
  }
}
