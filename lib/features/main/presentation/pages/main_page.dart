import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tech/core/router/app_router.dart';
import 'package:tech/features/main/presentation/widgets/main_navigation_bar.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return MainNavigationBar(tabsRouter: tabsRouter);
      },
    );
  }
}
