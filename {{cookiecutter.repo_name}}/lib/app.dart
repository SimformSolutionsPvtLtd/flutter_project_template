import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'locator.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'utils/extensions.dart';
import 'values/app_theme.dart';
import 'values/app_theme_store.dart';

// TODO(user): Change name of app as per Project
class WellnessApp extends StatelessWidget {
  const WellnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = context.provide<AppThemeStore>();
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance.getLightTheme(),
          darkTheme: AppTheme.instance.getDarkTheme(),
          themeMode: themeStore.themeMode,
          home: const SplashScreen(),
          routes: Routes.routes,
          navigatorKey: locator<NavigationService>().navigatorKey,
        );
      },
    );
  }
}
