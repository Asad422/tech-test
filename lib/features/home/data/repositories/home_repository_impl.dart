import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/session/cached_user_snapshot.dart';
import 'package:tech/core/session/user_profile_cache.dart';
import 'package:tech/features/home/domain/entities/business_entity.dart';

import '../../domain/entities/user_info_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._profileCache, this._dataSource);

  final UserProfileCache _profileCache;
  final HomeDataSource _dataSource;

  UserInfoEntity _fromCachedUser(CachedUserSnapshot u) {
    return UserInfoEntity(
      id: u.id,
      name: u.name,
      email: u.email,
      avatar: u.avatar,
      phone: '',
      businessCount: 0,
    );
  }

  @override
  Future<Either<Failure, UserInfoEntity>> getUser() async {
    try {
      final cached = await _profileCache.read();
      if (cached != null) {
        return Right(_fromCachedUser(cached));
      }
      final user = await _dataSource.getUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BusinessEntity>>> getBusinesses() async {
    try {
      final businesses = await _dataSource.getBusinesses();
      return Right(businesses);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}