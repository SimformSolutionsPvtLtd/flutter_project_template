import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'utils/extensions.dart';
import 'values/app_theme_store.dart';

/// represents the pixel ratio of the device
double devicePixelRatio = 0;

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Builder(
        builder: (ctx) => Provider(
          create: (_) => AppThemeStore(),
          child: const SimformApp(),
        ),
      ),
    );
  }
}
