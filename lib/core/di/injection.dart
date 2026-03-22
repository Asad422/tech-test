import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech/features/auth/data/data_sources/email_auth_data_source.dart';
import 'package:tech/features/auth/data/data_sources/google_auth_data_source.dart';
import 'package:tech/features/auth/data/data_sources/mock_email_auth_data_source.dart';
import 'package:tech/core/config/app_env.dart';
import 'package:tech/features/auth/data/data_sources/remote_google_auth_data_source.dart';
import 'package:tech/core/session/auth_session_reader.dart';
import 'package:tech/core/session/user_profile_cache.dart';
import 'package:tech/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:tech/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tech/features/home/data/datasources/home_data_source.dart';
import 'package:tech/features/home/data/datasources/mock_home_data_source.dart';
import 'package:tech/features/home/data/repositories/home_repository_impl.dart';
import 'package:tech/features/home/domain/repositories/home_repository.dart';
import 'package:tech/features/home/domain/usecases/get_businesses_usecase.dart';
import 'package:tech/features/home/domain/usecases/get_user_usecase.dart';
import 'package:tech/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:tech/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:tech/features/settings/domain/repositories/settings_repository.dart';
import 'package:tech/features/settings/domain/usecases/load_settings_usecase.dart';
import 'package:tech/features/settings/domain/usecases/save_locale_usecase.dart';
import 'package:tech/features/settings/domain/usecases/save_theme_usecase.dart';
import 'package:tech/features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../guards/auth_guard.dart';
import '../router/app_router.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton<AuthSessionReader>(
    () => SecureStorageAuthSessionReader(getIt()),
  );
  getIt.registerLazySingleton(() => AuthGuard(getIt()));
  getIt.registerLazySingleton(() => AppRouter(getIt()));

  getIt.registerLazySingleton(() => UserProfileCache(getIt()));

  getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => LoadSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveThemeUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveLocaleUseCase(getIt()));

  getIt.registerLazySingleton<EmailAuthDataSource>(
    () => MockEmailAuthDataSource(getIt()),
  );
  getIt.registerLazySingleton<GoogleAuthDataSource>(
    () => RemoteGoogleAuthDataSource(getIt(), AppEnv.googleServerClientId),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<UserProfileCache>(),
      getIt<EmailAuthDataSource>(),
      getIt<GoogleAuthDataSource>(),
      getIt<AuthSessionReader>(),
    ),
  );

  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithGoogleUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));

  getIt.registerLazySingleton<HomeDataSource>(
    () => MockHomeDataSource(),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      getIt<UserProfileCache>(),
      getIt<HomeDataSource>(),
    ),
  );

  getIt.registerLazySingleton(() => GetUserUseCase(getIt()));
  getIt.registerLazySingleton(() => GetBusinessesUseCase(getIt()));

  getIt.registerFactory(
    () => HomeBloc(getIt(), getIt()),
  );

  getIt.registerFactory(
    () => SettingsBloc(
      getIt<LoadSettingsUseCase>(),
      getIt<SaveThemeUseCase>(),
      getIt<SaveLocaleUseCase>(),
    ),
  );
}
