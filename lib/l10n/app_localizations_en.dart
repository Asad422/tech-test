// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tech App';

  @override
  String get loginWelcomeTitle => 'Welcome!';

  @override
  String get loginWelcomeSubtitle => 'Sign in to continue';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get validationEmailRequired => 'Enter your email';

  @override
  String get validationEmailInvalid => 'Enter a valid email';

  @override
  String get validationPasswordRequired => 'Enter your password';

  @override
  String get validationPasswordMinLength =>
      'Password must be at least 8 characters';

  @override
  String get loginButton => 'Sign in';

  @override
  String get loginOrDivider => 'or';

  @override
  String get loginWithGoogle => 'Sign in with Google';

  @override
  String get tooltipShowPassword => 'Show password';

  @override
  String get tooltipHidePassword => 'Hide password';

  @override
  String get homeTitle => 'Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String homeGreeting(String firstName) {
    return 'Hi, $firstName';
  }

  @override
  String get homeBusinessesTitle => 'My businesses';

  @override
  String get businessStatusActive => 'Active';

  @override
  String get businessStatusInactive => 'Inactive';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionLanguage => 'Language';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsLanguageRussian => 'Russian';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLogout => 'Log out';

  @override
  String get settingsLogoutDialogTitle => 'Log out?';

  @override
  String get settingsLogoutDialogMessage => 'Are you sure you want to log out?';

  @override
  String get settingsCancel => 'Cancel';

  @override
  String get settingsLogoutConfirm => 'Log out';
}
