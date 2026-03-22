import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/home/domain/entities/business_entity.dart';
import 'package:tech/features/home/domain/repositories/home_repository.dart';

class GetBusinessesUseCase extends UseCase<List<BusinessEntity>, NoParams> {
  GetBusinessesUseCase(this._repository);

  final HomeRepository _repository;

  @override
  Future<Either<Failure, List<BusinessEntity>>> call(NoParams params) {
    return _repository.getBusinesses();
  }
}
