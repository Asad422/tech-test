import 'package:tech/features/auth/domain/entities/user_entity.dart';

abstract class GoogleAuthDataSource {
  Future<UserEntity> loginWithGoogle();

  Future<void> logout();
}
