import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'modules/splashScreen/splash_screen_store.dart';
import 'values/strings.dart';
import 'utils/extensions.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AppStrings.txtAfterSplash: (context) =>
        AfterSplash().withProvider<SplashScreenStore>(SplashScreenStore()),
  };
}
