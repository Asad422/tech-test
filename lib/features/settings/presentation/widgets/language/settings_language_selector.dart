import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/l10n/context_l10n.dart';
import 'package:tech/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:tech/features/settings/presentation/bloc/settings_event.dart';

class SettingsLanguageSelector extends StatelessWidget {
  final Locale locale;

  const SettingsLanguageSelector({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _LanguageTile(
            title: l10n.settingsLanguageRussian,
            flag: '🇷🇺',
            selected: locale.languageCode == 'ru',
            onTap: () => context.read<SettingsBloc>().add(
              const ChangeLanguage(Locale('ru')),
            ),
          ),
          const Divider(height: 1),
          _LanguageTile(
            title: l10n.settingsLanguageEnglish,
            flag: '🇬🇧',
            selected: locale.languageCode == 'en',
            onTap: () => context.read<SettingsBloc>().add(
              const ChangeLanguage(Locale('en')),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String title;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.title,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(title),
      trailing: selected
          ? Icon(Icons.check_rounded, color: color.primary)
          : null,
      onTap: onTap,
    );
  }
}
