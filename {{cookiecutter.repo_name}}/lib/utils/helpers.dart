import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

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

/// allows to create a provider with less boilerplate
Provider<T> createProviderFor<T>(T provide, {Dispose<T>? dispose}) =>
    Provider<T>(create: (context) => provide, dispose: dispose);

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