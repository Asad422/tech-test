import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech/core/constants/auth_storage_keys.dart';
import 'package:tech/features/auth/domain/entities/user_entity.dart';

import 'email_auth_data_source.dart';

class MockEmailAuthDataSource implements EmailAuthDataSource {
  MockEmailAuthDataSource(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<UserEntity> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    await _storage.write(key: AuthStorageKeys.token, value: 'mock_email_token');
    return const UserEntity(
      id: '1',
      name: 'Asad Tazhibaev',
      email: 'asadtajib@gmail.com',
      avatar: null,
    );
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: AuthStorageKeys.token);
  }
}
