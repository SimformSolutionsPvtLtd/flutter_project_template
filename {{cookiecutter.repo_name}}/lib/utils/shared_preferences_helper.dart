import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static const String kLoginUser = 'loginUser';
  static const String kAuthToken = 'authToken';
  static const String kMetaData = 'metaData';

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
  Future<void> setLoginUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kLoginUser, value);
  }

  Future<void> setMetaData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kMetaData, value);
  }

  /// ----------------------------------------------------------
  /// Method that saves the value for the key
  /// ----------------------------------------------------------

  Future<void> setAuthToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kAuthToken, value);
  }

  Future<void> clearPreferences() async {
    // ignore: omit_local_variable_types
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
