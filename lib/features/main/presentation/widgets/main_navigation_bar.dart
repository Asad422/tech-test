import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tech/l10n/context_l10n.dart';

class MainNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const MainNavigationBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NavigationBar(
      selectedIndex: tabsRouter.activeIndex,
      onDestinationSelected: tabsRouter.setActiveIndex,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home_rounded),
          label: l10n.homeTitle,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings_rounded),
          label: l10n.settingsTitle,
        ),
      ],
    );
  }
}
