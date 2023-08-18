import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../values/enumeration.dart';

///This is a helper class to store sensitive information, for example auth
///tokens.
class SecureStorage {
  const SecureStorage._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> setValue({
    required SecureStorageKeys key,
    required String? value,
  }) async =>
      _storage.write(key: key.name, value: value);

  static Future<String?> getValue({required SecureStorageKeys key}) async =>
      _storage.read(key: key.name);

  static Future<void> delete({required SecureStorageKeys key}) async =>
      _storage.delete(key: key.name);

  static Future<void> deleteAll() async => _storage.deleteAll();
}
