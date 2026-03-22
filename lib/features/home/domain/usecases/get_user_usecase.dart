import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import '../entities/user_info_entity.dart';
import '../repositories/home_repository.dart';

class GetUserUseCase extends UseCase<UserInfoEntity, NoParams> {
  final HomeRepository _repository;
  GetUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserInfoEntity>> call(NoParams params) {
    return _repository.getUser();
  }
}