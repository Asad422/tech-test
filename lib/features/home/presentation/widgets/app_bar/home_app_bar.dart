import 'package:flutter/material.dart';
import 'package:tech/l10n/context_l10n.dart';

import '../../../domain/entities/user_info_entity.dart';

class HomeAppBar extends StatelessWidget {
  final UserInfoEntity user;

  const HomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SliverAppBar(
      floating: true,
      backgroundColor: color.surface,
      title: Text(
        context.l10n.homeGreeting(user.name.split(' ').first),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
