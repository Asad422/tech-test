import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/di/injection.dart';
import 'package:tech/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech/features/home/presentation/bloc/home_event.dart';
import 'package:tech/features/home/presentation/bloc/home_state.dart';
import 'package:tech/features/home/presentation/widgets/body/home_loaded_body.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const LoadHomeData()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            HomeLoading() => const Center(child: CircularProgressIndicator()),
            HomeFailure() => Center(child: Text(state.message)),
            HomeLoaded() => HomeLoadedBody(state: state),
            _ => const SizedBox(),
          },
        );
      },
    );
  }
}
