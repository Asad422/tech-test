import 'package:flutter/material.dart';
import 'package:tech/l10n/context_l10n.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: color.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.lock_rounded, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 24),
        Text(
          context.l10n.loginWelcomeTitle,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.loginWelcomeSubtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
