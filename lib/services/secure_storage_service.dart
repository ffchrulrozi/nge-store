import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future setToken(String token) async {
    await _secureStorage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: "token");
  }
  
  static deleteToken() async {
    await _secureStorage.delete(key: "token");
  }
}
