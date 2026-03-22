import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tech/core/constants/auth_storage_keys.dart';
import 'package:tech/features/auth/domain/entities/user_entity.dart';

import 'google_auth_data_source.dart';

class RemoteGoogleAuthDataSource implements GoogleAuthDataSource {
  RemoteGoogleAuthDataSource(this._storage, this._serverClientId);

  final FlutterSecureStorage _storage;
  final String _serverClientId;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    await _googleSignIn.initialize(
      serverClientId: _serverClientId,
    );
    _initialized = true;
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    await _ensureInitialized();
    try {
      final account = await _googleSignIn.authenticate();
      final idToken = account.authentication.idToken;
      await _storage.write(
        key: AuthStorageKeys.token,
        value: idToken ?? 'google_${account.id}',
      );
      return UserEntity(
        id: account.id,
        name: account.displayName ?? '',
        email: account.email,
        avatar: account.photoUrl,
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw Exception('Google Sign In отменён');
      }
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _ensureInitialized();
    await _googleSignIn.signOut();
    await _storage.delete(key: AuthStorageKeys.token);
  }
}
