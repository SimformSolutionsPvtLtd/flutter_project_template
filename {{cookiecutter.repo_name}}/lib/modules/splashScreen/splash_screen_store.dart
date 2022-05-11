import 'dart:async';

import 'package:mobx/mobx.dart';
import '../../values/enumeration.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenStore with _$SplashScreenStore;

abstract class _SplashScreenStore with Store {
  @observable
  NetworkState state = NetworkState.idle;

  Future<void> changeNetworkState() async {
    state = NetworkState.loading;
    try {
      // TODO(username): API call here
      state = NetworkState.success;
    } catch (error) {
      state = NetworkState.error;
    }
  }
}
