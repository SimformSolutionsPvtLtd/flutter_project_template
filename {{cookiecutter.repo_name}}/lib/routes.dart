import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:{{cookiecutter.repo_name}}/modules/splashScreen/splash_screen.dart';
import 'package:{{cookiecutter.repo_name}}/values/strings.dart';



class Routes {

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AppStrings.txtAfterSplash : (context) => AfterSplash(),
  };
}
