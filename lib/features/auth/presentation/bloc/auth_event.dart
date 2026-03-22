import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class LoginRequested extends AuthEvent {
  const LoginRequested(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

final class LoginWithGoogleRequested extends AuthEvent {
  const LoginWithGoogleRequested();
}

final class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
