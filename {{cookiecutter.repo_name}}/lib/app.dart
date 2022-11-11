import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'utils/extensions.dart';
import 'values/app_theme.dart';
import 'values/app_theme_store.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

// TODO(user): Change name of app as per Project
class SimformApp extends StatelessWidget {
  const SimformApp({super.key});

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
          onGenerateRoute: Routes.generateRoute,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
