import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../values/enumeration.dart';

class SharedPrefs {
  const SharedPrefs._();

  static late final SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Provides saved shared preferences value based on enum key
  static dynamic getSharedProperty({
    required SharedPrefsKeys keyEnum,
  }) {
    return switch (keyEnum) {
      SharedPrefsKeys.isLoggedIn =>
          _prefs.getString(SharedPrefsKeys.isLoggedIn.name),
    };
  }

  /// Sets value to provided key as key-value pair in shared preferences
  static Future<bool> setSharedProperty({
    required dynamic value,
    required SharedPrefsKeys keyEnum,
  }) async {
    if (value == null) return false;
    return switch (value.runtimeType) {
      bool => _prefs.setBool(keyEnum.name, value as bool),
      int => _prefs.setInt(keyEnum.name, value as int),
      double => _prefs.setDouble(keyEnum.name, value as double),
      _ => _prefs.setString(keyEnum.name, value.toString()),
    };
  }

  /// Clears all saved key-value pairs
  static Future<bool> clearPreferences() async => _prefs.clear();
}
