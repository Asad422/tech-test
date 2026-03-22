import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:tech/features/settings/domain/entities/settings_preferences.dart';
import 'package:tech/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._local);

  final SettingsLocalDataSource _local;

  @override
  Future<Either<Failure, SettingsPreferences>> load() async {
    try {
      final theme = await _local.getThemeMode();
      final locale = await _local.getLocale();
      return Right(SettingsPreferences(themeMode: theme, locale: locale));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveTheme(ThemeMode themeMode) async {
    try {
      await _local.setThemeMode(themeMode);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocale(Locale locale) async {
    try {
      await _local.setLocale(locale);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
