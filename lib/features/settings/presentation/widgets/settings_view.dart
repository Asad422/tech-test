import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/router/app_router.dart';
import 'package:tech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech/features/auth/presentation/bloc/auth_state.dart';
import 'package:tech/l10n/context_l10n.dart';
import 'package:tech/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:tech/features/settings/presentation/bloc/settings_state.dart';
import 'package:tech/features/settings/presentation/widgets/account/settings_logout_button.dart';
import 'package:tech/features/settings/presentation/widgets/common/settings_section_title.dart';
import 'package:tech/features/settings/presentation/widgets/language/settings_language_selector.dart';
import 'package:tech/features/settings/presentation/widgets/theme/settings_theme_selector.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous is AuthLoading &&
          (current is AuthInitial || current is AuthFailure),
      listener: (context, state) {
        if (state is AuthInitial) {
          context.router.root.replaceAll([const LoginRoute()]);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final l10n = context.l10n;
        final authLoading = context.watch<AuthBloc>().state is AuthLoading;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text(
                  l10n.settingsTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SettingsSectionTitle(title: l10n.settingsSectionAppearance),
                    const SizedBox(height: 8),
                    SettingsThemeSelector(themeMode: state.themeMode),
                    const SizedBox(height: 24),
                    SettingsSectionTitle(title: l10n.settingsSectionLanguage),
                    const SizedBox(height: 8),
                    SettingsLanguageSelector(locale: state.locale),
                    const SizedBox(height: 24),
                    SettingsSectionTitle(title: l10n.settingsSectionAccount),
                    const SizedBox(height: 8),
                    SettingsLogoutButton(isLoading: authLoading),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
