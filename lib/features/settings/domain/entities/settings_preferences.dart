import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsPreferences extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;

  const SettingsPreferences({
    required this.themeMode,
    required this.locale,
  });

  @override
  List<Object?> get props => [themeMode, locale];
}
