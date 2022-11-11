import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../values/enumeration.dart';

class SharedPreferencesService {
  SharedPreferencesService._();

  static final SharedPreferencesService instance = SharedPreferencesService._();

  late SharedPreferences _prefs;

  Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Provides saved shared preferences value based on enum key
  Future<dynamic> getSharedProperty({
    required SharedPrefsKeys key,
  }) async {
    switch (key) {
      case SharedPrefsKeys.isLoggedIn:
        return _prefs.getString(SharedPrefsKeys.isLoggedIn.name);
    }
  }

  /// Sets value to provided key as key-value pair in shared preferences
  Future<bool?> setSharedProperty({
    required dynamic value,
    required SharedPrefsKeys keyEnum,
  }) async {
    if (value != null) {
      switch (value.runtimeType) {
        case bool:
          return _prefs.setBool(keyEnum.name, value as bool);
        case int:
          return _prefs.setInt(keyEnum.name, value as int);
        case double:
          return _prefs.setDouble(keyEnum.name, value as double);
        case String:
          return _prefs.setString(keyEnum.name, value as String);
      }
    }
    return null;
  }

  /// Clears all saved key-value pairs
  Future<void> clearPreferences() async {
    await _prefs.clear();
  }
}
