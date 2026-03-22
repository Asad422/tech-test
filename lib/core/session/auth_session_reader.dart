import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech/core/constants/auth_storage_keys.dart';

abstract interface class AuthSessionReader {
  Future<bool> hasSession();
}

class SecureStorageAuthSessionReader implements AuthSessionReader {
  SecureStorageAuthSessionReader(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<bool> hasSession() async {
    final token = await _storage.read(key: AuthStorageKeys.token);
    return token != null && token.isNotEmpty;
  }
}
