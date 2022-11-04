import 'package:connectivity_plus/connectivity_plus.dart';

/// class to check for internet availability
class NetworkUtils {
  Future<bool> checkIsInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(Function(bool) func) {
    checkIsInternet().then((internet) {
      if (internet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
