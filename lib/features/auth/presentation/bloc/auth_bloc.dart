import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/auth/domain/usecases/login_usecase.dart';
import 'package:tech/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:tech/features/auth/domain/usecases/logout_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(
    this._loginUseCase,
    this._loginWithGoogleUseCase,
    this._logoutUseCase,
  ) : super(const AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<LoginWithGoogleRequested>(_onGoogleLogin);
    on<LogoutRequested>(_onLogout);
  }

  Future<void> _onLogin(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onGoogleLogin(
    LoginWithGoogleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _loginWithGoogleUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onLogout(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const AuthInitial()),
    );
  }
}