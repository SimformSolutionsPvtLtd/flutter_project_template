import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../values/enumeration.dart';

///This is a helper class to store sensitive information, for example auth
///tokens.
class SecureStorageService {
  SecureStorageService._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static final SecureStorageService instance = SecureStorageService._();

  Future<void> setValue({
    required SecureStorageKeys key,
    required String? value,
  }) async {
    await _storage.write(
      key: key.name,
      value: value,
    );
  }

  Future<String?> getValue({required SecureStorageKeys key}) async {
    final data = await _storage.read(key: key.name);
    return data;
  }

  Future<void> delete({required SecureStorageKeys key}) async {
    if (await _storage.containsKey(key: key.name)) {
      await _storage.delete(key: key.name);
    }
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
