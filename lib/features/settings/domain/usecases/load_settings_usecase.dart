import 'package:dartz/dartz.dart';
import 'package:tech/core/errors/failure.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/settings/domain/entities/settings_preferences.dart';
import 'package:tech/features/settings/domain/repositories/settings_repository.dart';

class LoadSettingsUseCase extends UseCase<SettingsPreferences, NoParams> {
  LoadSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Either<Failure, SettingsPreferences>> call(NoParams params) {
    return _repository.load();
  }
}
