import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/features/settings/domain/entities/settings_preferences.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsPreferences>> load();

  Future<Either<Failure, void>> saveTheme(ThemeMode themeMode);

  Future<Either<Failure, void>> saveLocale(Locale locale);
}
