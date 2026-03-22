import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech/core/constants/auth_storage_keys.dart';
import 'package:tech/features/auth/domain/entities/user_entity.dart';

import 'google_auth_data_source.dart';

class MockGoogleAuthDataSource implements GoogleAuthDataSource {
  MockGoogleAuthDataSource(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<UserEntity> loginWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    await _storage.write(key: AuthStorageKeys.token, value: 'google_mock_token');
    return const UserEntity(
      id: '2',
      name: 'Asad Google',
      email: 'asadtajib@gmail.com',
      avatar: null,
    );
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: AuthStorageKeys.token);
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: AuthStorageKeys.token);
    return token != null;
  }
}
