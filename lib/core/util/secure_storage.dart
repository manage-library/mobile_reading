import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  FlutterSecureStorage get flutterSecureStorage => _flutterSecureStorage;

  Future<String?> read(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> write(String key, dynamic value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}