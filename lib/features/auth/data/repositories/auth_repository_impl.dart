import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/session/auth_session_reader.dart';
import 'package:tech/core/session/cached_user_snapshot.dart';
import 'package:tech/core/session/user_profile_cache.dart';
import 'package:tech/features/auth/data/data_sources/email_auth_data_source.dart';
import 'package:tech/features/auth/data/data_sources/google_auth_data_source.dart';
import 'package:tech/features/auth/domain/entities/user_entity.dart';
import 'package:tech/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._profileCache,
    this._emailAuthDataSource,
    this._googleAuthDataSource,
    this._sessionReader,
  );

  final UserProfileCache _profileCache;
  final EmailAuthDataSource _emailAuthDataSource;
  final GoogleAuthDataSource _googleAuthDataSource;
  final AuthSessionReader _sessionReader;

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final user = await _emailAuthDataSource.login(email, password);
      await _profileCache.save(
        CachedUserSnapshot(
          id: user.id,
          name: user.name,
          email: user.email,
          avatar: user.avatar,
        ),
      );
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await _googleAuthDataSource.loginWithGoogle();
      await _profileCache.save(
        CachedUserSnapshot(
          id: user.id,
          name: user.name,
          email: user.email,
          avatar: user.avatar,
        ),
      );
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _profileCache.clear();
      await _googleAuthDataSource.logout();
      await _emailAuthDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await _sessionReader.hasSession();
      return Right(result);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
