// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Tech App';

  @override
  String get loginWelcomeTitle => 'Добро пожаловать!';

  @override
  String get loginWelcomeSubtitle => 'Войдите чтобы продолжить';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginPasswordLabel => 'Пароль';

  @override
  String get validationEmailRequired => 'Введите email';

  @override
  String get validationEmailInvalid => 'Введите корректный email';

  @override
  String get validationPasswordRequired => 'Введите пароль';

  @override
  String get validationPasswordMinLength => 'Пароль минимум 8 символов';

  @override
  String get loginButton => 'Войти';

  @override
  String get loginOrDivider => 'или';

  @override
  String get loginWithGoogle => 'Войти через Google';

  @override
  String get tooltipShowPassword => 'Показать пароль';

  @override
  String get tooltipHidePassword => 'Скрыть пароль';

  @override
  String get homeTitle => 'Главная';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String homeGreeting(String firstName) {
    return 'Привет, $firstName';
  }

  @override
  String get homeBusinessesTitle => 'Мои бизнесы';

  @override
  String get businessStatusActive => 'Активен';

  @override
  String get businessStatusInactive => 'Неактивен';

  @override
  String get settingsSectionAppearance => 'Внешний вид';

  @override
  String get settingsSectionLanguage => 'Язык';

  @override
  String get settingsSectionAccount => 'Аккаунт';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsThemeSystem => 'Системная';

  @override
  String get settingsLanguageRussian => 'Русский';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLogout => 'Выйти из аккаунта';

  @override
  String get settingsLogoutDialogTitle => 'Выйти из аккаунта?';

  @override
  String get settingsLogoutDialogMessage => 'Вы уверены что хотите выйти?';

  @override
  String get settingsCancel => 'Отмена';

  @override
  String get settingsLogoutConfirm => 'Выйти';
}
