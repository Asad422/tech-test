import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<ThemeMode> getThemeMode();

  Future<void> setThemeMode(ThemeMode mode);

  Future<Locale> getLocale();

  Future<void> setLocale(Locale locale);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  static const _themeKey = 'theme';
  static const _langKey = 'lang';

  ThemeMode _parseTheme(String? raw) {
    if (raw == null) return ThemeMode.system;
    for (final mode in ThemeMode.values) {
      if (mode.name == raw) return mode;
    }
    return ThemeMode.system;
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    return _parseTheme(_prefs.getString(_themeKey));
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(_themeKey, mode.name);
  }

  @override
  Future<Locale> getLocale() async {
    final code = _prefs.getString(_langKey) ?? 'ru';
    return Locale(code);
  }

  @override
  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_langKey, locale.languageCode);
  }
}
