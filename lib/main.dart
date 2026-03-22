import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech/features/auth/domain/usecases/login_usecase.dart';
import 'package:tech/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:tech/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:tech/features/settings/presentation/bloc/settings_state.dart';
import 'package:tech/firebase_options.dart';
import 'package:tech/l10n/app_localizations.dart';
import 'package:tech/l10n/context_l10n.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  setupDI(prefs);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            getIt<LoginUseCase>(),
            getIt<LoginWithGoogleUseCase>(),
            getIt<LogoutUseCase>(),
          ),
        ),
        BlocProvider(create: (_) => getIt<SettingsBloc>()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.appTitle,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light, 
            darkTheme: AppTheme.dark, 
            themeMode: state.themeMode, 
            locale: state.locale,
            routerConfig: getIt<AppRouter>().config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
