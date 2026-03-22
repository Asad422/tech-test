import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech/core/constants/auth_storage_keys.dart';
import 'package:tech/core/session/cached_user_snapshot.dart';

class UserProfileCache {
  UserProfileCache(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> save(CachedUserSnapshot user) async {
    final map = <String, dynamic>{
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'avatar': user.avatar,
    };
    await _storage.write(
      key: AuthStorageKeys.cachedUserProfile,
      value: jsonEncode(map),
    );
  }

  Future<CachedUserSnapshot?> read() async {
    final raw = await _storage.read(key: AuthStorageKeys.cachedUserProfile);
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return CachedUserSnapshot(
        id: map['id'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        avatar: map['avatar'] as String?,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    await _storage.delete(key: AuthStorageKeys.cachedUserProfile);
  }
}
