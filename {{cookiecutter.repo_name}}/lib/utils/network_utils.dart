import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Class to check for internet availability
class NetworkUtils {
  NetworkUtils._initialise() {
    networkStream = Connectivity().onConnectivityChanged;
  }

  static final NetworkUtils instance = NetworkUtils._initialise();

  /// A stream to monitor state changes in network connectivity.
  late Stream<ConnectivityResult> networkStream;

  /// Returns false if connectivity result is none otherwise true.
  Future<bool> checkHasInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
