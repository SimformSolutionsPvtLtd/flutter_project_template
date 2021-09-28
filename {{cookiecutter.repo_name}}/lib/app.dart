import 'package:flutter/material.dart';

import 'locator.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'values/app_colors.dart';

class WellnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.colorPrimary,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.colorAccent),
        unselectedWidgetColor: AppColors.colorPrimary,
      ),
      home: SplashScreen(),
      routes: Routes.routes,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
