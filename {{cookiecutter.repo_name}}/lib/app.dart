import 'package:flutter/material.dart';

import 'locator.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'values/app_colors.dart';

/// Change name of app as per Project
class WellnessApp extends StatelessWidget {
  const WellnessApp({Key? key}) : super(key: key);

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
      home: const SplashScreen(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
