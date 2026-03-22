
import 'package:tech/core/guards/auth_guard.dart';
import 'package:tech/features/auth/presentation/login_page.dart';
import 'package:tech/features/home/presentation/home_page.dart';
import 'package:tech/features/settings/presentation/settings_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tech/features/main/presentation/pages/main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;
  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(
      page: MainRoute.page,
      guards: [authGuard],
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
