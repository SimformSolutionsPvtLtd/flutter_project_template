import 'dart:async';
import 'package:flutter/material.dart';
import 'package:{{cookiecutter.repo_name}}/resources/resources.dart';
import 'package:{{cookiecutter.repo_name}}/values/app_colors.dart';
import 'package:{{cookiecutter.repo_name}}/values/strings.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(AppStrings.txtAfterSplash);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Image.asset(
                  Images.splash,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                )),
          ],
        ),
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: Text(""),
          automaticallyImplyLeading: false
      ),
      body:  Container(
      ),
    );
  }
}