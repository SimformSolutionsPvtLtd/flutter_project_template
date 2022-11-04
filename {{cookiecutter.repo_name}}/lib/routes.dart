import 'package:chq_flutter/values/navigation_paths.dart';
import 'package:flutter/material.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'modules/splashScreen/splash_screen_store.dart';
import 'utils/extensions.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigationPaths.txtAfterSplash:
        return MaterialPageRoute<void>(
          builder: (context) =>
              const AfterSplash().withProvider(SplashScreenStore()),
        );
    // Note: this will never be used. This is just for detecting
    // invalid Routes
      default:
      // return MaterialPageRoute(builder: (_) => InvalidRoute());
        return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
    }
  }
}
