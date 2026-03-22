import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/settings/domain/usecases/load_settings_usecase.dart';
import 'package:tech/features/settings/domain/usecases/save_locale_usecase.dart';
import 'package:tech/features/settings/domain/usecases/save_theme_usecase.dart';
import 'package:tech/features/settings/presentation/bloc/settings_state.dart';

import 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    this._loadSettingsUseCase,
    this._saveThemeUseCase,
    this._saveLocaleUseCase,
  ) : super(const SettingsState()) {
    on<SettingsLoadRequested>(_onLoadRequested);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeLanguage>(_onChangeLanguage);
    add(const SettingsLoadRequested());
  }

  final LoadSettingsUseCase _loadSettingsUseCase;
  final SaveThemeUseCase _saveThemeUseCase;
  final SaveLocaleUseCase _saveLocaleUseCase;

  Future<void> _onLoadRequested(
    SettingsLoadRequested event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _loadSettingsUseCase(const NoParams());
    result.fold(
      (_) {},
      (prefs) => emit(
        state.copyWith(
          themeMode: prefs.themeMode,
          locale: prefs.locale,
        ),
      ),
    );
  }

  Future<void> _onChangeTheme(
    ChangeTheme event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _saveThemeUseCase(SaveThemeParams(event.themeMode));
    result.fold(
      (_) {},
      (_) => emit(state.copyWith(themeMode: event.themeMode)),
    );
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _saveLocaleUseCase(SaveLocaleParams(event.locale));
    result.fold(
      (_) {},
      (_) => emit(state.copyWith(locale: event.locale)),
    );
  }
}
