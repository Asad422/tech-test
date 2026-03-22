import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/features/home/domain/entities/business_entity.dart';
import '../entities/user_info_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserInfoEntity>> getUser();
  Future<Either<Failure, List<BusinessEntity>>> getBusinesses();
}