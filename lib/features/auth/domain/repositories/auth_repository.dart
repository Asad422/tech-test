import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLoggedIn();
}