import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/settings/domain/repositories/settings_repository.dart';

class SaveThemeParams {
  const SaveThemeParams(this.themeMode);

  final ThemeMode themeMode;
}

class SaveThemeUseCase extends UseCase<void, SaveThemeParams> {
  SaveThemeUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Either<Failure, void>> call(SaveThemeParams params) {
    return _repository.saveTheme(params.themeMode);
  }
}
