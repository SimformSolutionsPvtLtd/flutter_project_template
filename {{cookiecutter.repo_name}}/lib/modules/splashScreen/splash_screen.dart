import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../resources/resources.dart';
import '../../utils/extensions.dart';
import '../../values/strings.dart';
import 'splash_screen_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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

  Future<void> _loadWidget() async {
    final _duration = Duration(seconds: splashDelay);
    Future.delayed(_duration, () {
      navigationPage
    });
  }

  void navigationPage() =>
      context.pushReplacementNamed(AppStrings.txtAfterSplash);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Column(
          children: <Widget>[
            Image.asset(
              Images.splash,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
          ],
        ),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashStore = Provider.of<SplashScreenStore>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(''), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) =>
                  Text(
                    'Network State : ${splashStore.state}',
                    style: const TextStyle(fontSize: 20),
                  ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: splashStore.changeNetworkState,
              child: const Text('Change State'),
            ),
          ],
        ),
      ),
    );
  }
}
