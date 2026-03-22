import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/l10n/context_l10n.dart';
import 'package:tech/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:tech/features/settings/presentation/bloc/settings_event.dart';

class SettingsThemeSelector extends StatelessWidget {
  final ThemeMode themeMode;

  const SettingsThemeSelector({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _ThemeTile(
            title: l10n.settingsThemeLight,
            icon: Icons.light_mode_rounded,
            selected: themeMode == ThemeMode.light,
            onTap: () => context.read<SettingsBloc>().add(
              const ChangeTheme(ThemeMode.light),
            ),
          ),
          const Divider(height: 1),
          _ThemeTile(
            title: l10n.settingsThemeDark,
            icon: Icons.dark_mode_rounded,
            selected: themeMode == ThemeMode.dark,
            onTap: () => context.read<SettingsBloc>().add(
              const ChangeTheme(ThemeMode.dark),
            ),
          ),
          const Divider(height: 1),
          _ThemeTile(
            title: l10n.settingsThemeSystem,
            icon: Icons.brightness_auto_rounded,
            selected: themeMode == ThemeMode.system,
            onTap: () => context.read<SettingsBloc>().add(
              const ChangeTheme(ThemeMode.system),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: selected ? color.primary : null),
      title: Text(title),
      trailing: selected
          ? Icon(Icons.check_rounded, color: color.primary)
          : null,
      onTap: onTap,
    );
  }
}
