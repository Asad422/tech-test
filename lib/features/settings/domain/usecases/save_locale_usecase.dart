import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/settings/domain/repositories/settings_repository.dart';

class SaveLocaleParams {
  const SaveLocaleParams(this.locale);

  final Locale locale;
}

class SaveLocaleUseCase extends UseCase<void, SaveLocaleParams> {
  SaveLocaleUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Either<Failure, void>> call(SaveLocaleParams params) {
    return _repository.saveLocale(params.locale);
  }
}
