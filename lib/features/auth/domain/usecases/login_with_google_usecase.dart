import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase extends UseCase<UserEntity, NoParams> {
  final AuthRepository _repository;
  LoginWithGoogleUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return _repository.loginWithGoogle();
  }
}