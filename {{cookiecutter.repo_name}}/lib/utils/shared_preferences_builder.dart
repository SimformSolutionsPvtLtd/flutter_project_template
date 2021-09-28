import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesBuilder<T> extends StatelessWidget {
  final String pref;
  final AsyncWidgetBuilder<T> builder;
  final Function rawJson;
  const SharedPreferencesBuilder({
    Key? key,
    required this.pref,
    required this.builder,
    required this.rawJson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: _future(),
        builder: builder);
  }

  Future<T> _future() async {
    return  rawJson((await SharedPreferences.getInstance())
        .getString(pref));
  }
}