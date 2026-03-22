import 'package:flutter/material.dart';
import 'package:tech/l10n/context_l10n.dart';

class LoginPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggle;
  final VoidCallback onSubmit;

  const LoginPasswordField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.onToggle,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      onFieldSubmitted: (_) => onSubmit(),
      decoration: InputDecoration(
        labelText: l10n.loginPasswordLabel,
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          tooltip: obscure ? l10n.tooltipShowPassword : l10n.tooltipHidePassword,
          icon: Icon(
            obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          onPressed: onToggle,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return l10n.validationPasswordRequired;
        }
        if (value.length < 8) {
          return l10n.validationPasswordMinLength;
        }
        return null;
      },
    );
  }
}
