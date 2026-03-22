import 'package:auto_route/auto_route.dart';
import 'package:tech/core/session/auth_session_reader.dart';

import '../router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._sessionReader);

  final AuthSessionReader _sessionReader;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await _sessionReader.hasSession()) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}