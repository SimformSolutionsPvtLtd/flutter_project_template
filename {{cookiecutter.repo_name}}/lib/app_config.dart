import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'utils/extensions.dart';
import 'app.dart';

/// represents the pixel ratio of the device
double devicePixelRatio = 0.0;

class AppConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Builder(
        builder: (ctx) {
          return WellnessApp();
        },
      ),
    );
  }
}
