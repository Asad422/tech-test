import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/router/app_router.dart';
import 'package:tech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech/features/auth/presentation/bloc/auth_event.dart';
import 'package:tech/features/auth/presentation/bloc/auth_state.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_email_field.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_google_button.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_header.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_or_divider.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_password_field.dart';
import 'package:tech/features/auth/presentation/widgets/login/login_submit_button.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginView();
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        LoginRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.router.replace(const MainRoute());
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      48,
                  child: AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LoginHeader(),
                          const SizedBox(height: 40),
                          LoginEmailField(controller: _emailController),
                          const SizedBox(height: 16),
                          LoginPasswordField(
                            controller: _passwordController,
                            obscure: _obscurePassword,
                            onToggle: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                            onSubmit: () => _onLogin(context),
                          ),
                          const SizedBox(height: 24),
                          LoginSubmitButton(
                            isLoading: state is AuthLoading,
                            onPressed: () => _onLogin(context),
                          ),
                          const SizedBox(height: 16),
                          const LoginOrDivider(),
                          const SizedBox(height: 16),
                          LoginGoogleButton(
                            isLoading: state is AuthLoading,
                            onPressed: () => context.read<AuthBloc>().add(
                              const LoginWithGoogleRequested(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
