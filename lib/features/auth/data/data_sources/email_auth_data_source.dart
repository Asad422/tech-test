import 'package:tech/features/auth/domain/entities/user_entity.dart';

abstract class EmailAuthDataSource {
  Future<UserEntity> login(String email, String password);

  Future<void> logout();
}
