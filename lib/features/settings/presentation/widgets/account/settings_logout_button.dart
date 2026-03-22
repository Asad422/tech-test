import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/l10n/context_l10n.dart';
import 'package:tech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech/features/auth/presentation/bloc/auth_event.dart';

class SettingsLogoutButton extends StatelessWidget {
  final bool isLoading;

  const SettingsLogoutButton({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.logout_rounded, color: Colors.red),
        title: Text(
          context.l10n.settingsLogout,
          style: const TextStyle(color: Colors.red),
        ),
        trailing: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.chevron_right_rounded, color: Colors.red),
        onTap: isLoading ? null : () => _showLogoutDialog(context),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        final l10n = ctx.l10n;
        return AlertDialog(
          title: Text(l10n.settingsLogoutDialogTitle),
          content: Text(l10n.settingsLogoutDialogMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.settingsCancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.read<AuthBloc>().add(const LogoutRequested());
              },
              child: Text(
                l10n.settingsLogoutConfirm,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
