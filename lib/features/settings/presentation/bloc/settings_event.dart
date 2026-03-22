import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class SettingsLoadRequested extends SettingsEvent {
  const SettingsLoadRequested();
}

final class ChangeTheme extends SettingsEvent {
  final ThemeMode themeMode;
  const ChangeTheme(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

final class ChangeLanguage extends SettingsEvent {
  final Locale locale;
  const ChangeLanguage(this.locale);

  @override
  List<Object?> get props => [locale];
}