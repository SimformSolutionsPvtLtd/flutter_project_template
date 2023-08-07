import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

/// allows to set system icon theme (light | dark)
void setSystemIcons({required bool dark}) {
  SystemChrome.setSystemUIOverlayStyle(
    (dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light).copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {});
}

void setAppOrientation() {
  SystemChrome.setPreferredOrientations([
  {%- if cookiecutter.include_portraitUp_orientation == "y" -%}
  DeviceOrientation.portraitUp,
  {% endif %}
  {%- if cookiecutter.include_landscapeLeft_orientation == "y" -%}
  DeviceOrientation.landscapeLeft,
  {% endif %}
  {%- if cookiecutter.include_portraitDown_orientation == "y" -%}
  DeviceOrientation.portraitDown,
  {% endif %}
  {%- if cookiecutter.include_landscapeRight_orientation == "y" -%}
  DeviceOrientation.landscapeRight,
  {% endif %}
  ]);
}

String enumToString(Object o) => o.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == enumToString(v!));
