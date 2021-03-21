import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String kLoginUser = "loginUser";
  static final String kAuthToken = "authToken";
  static final String kMetaData = "metaData";

  static final SharedPreferencesHelper instance = SharedPreferencesHelper();

  /// ------------------------------------------------------------
  /// Method that returns the value for the keys

  Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kAuthToken) ?? '';
  }


  /// ----------------------------------------------------------
  /// Method that saves the value for the key
  /// ----------------------------------------------------------
  void setLoginUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kLoginUser, value);
  }

  void setMetaData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kMetaData, value);
  }

  /// ----------------------------------------------------------
  /// Method that saves the value for the key
  /// ----------------------------------------------------------

  void setAuthToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kAuthToken, value);
  }

  Future<void> clearPreferences() async {
    // ignore: omit_local_variable_types
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
