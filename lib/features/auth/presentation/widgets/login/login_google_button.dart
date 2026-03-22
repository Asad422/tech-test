import 'package:flutter/material.dart';
import 'package:tech/l10n/context_l10n.dart';

class LoginGoogleButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LoginGoogleButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.g_mobiledata, size: 28),
      label: Text(context.l10n.loginWithGoogle),
    );
  }
}
