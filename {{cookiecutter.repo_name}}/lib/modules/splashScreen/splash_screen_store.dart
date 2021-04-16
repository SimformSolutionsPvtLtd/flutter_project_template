import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{cookiecutter.repo_name}}/values/enumeration.dart';

part 'splash_screen_store.g.dart';

class BuildSettingsStore = _BuildSettingsStore with _$BuildSettingsStore;

abstract class _BuildSettingsStore with Store {

  @observable
  NetworkState state = NetworkState.idle;

  Future<void> retrieveCurrentSettings(BuildContext context) async {
    state = NetworkState.loading;
    print('loading build settings');
    final pref = await SharedPreferences.getInstance();
    try {
      //TODO: API call here
      state = NetworkState.success;
    } on Exception catch (error, stacktrace) {
      state = NetworkState.error;
      print(error);
      print(stacktrace);
    }
  }

}
