import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'utils/extensions.dart';

/// represents the pixel ratio of the device
double devicePixelRatio = 0;

class AppConfig extends StatelessWidget {
  const AppConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Builder(
        builder: (ctx) => const WellnessApp(),
      ),
    );
  }
}
