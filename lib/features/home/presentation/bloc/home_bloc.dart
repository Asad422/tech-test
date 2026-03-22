import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/core/usecases/usecase.dart';
import 'package:tech/features/home/domain/usecases/get_businesses_usecase.dart';

import '../../domain/entities/user_info_entity.dart';
import '../../domain/usecases/get_user_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserUseCase _getUserUseCase;
  final GetBusinessesUseCase _getBusinessesUseCase;

  HomeBloc(this._getUserUseCase, this._getBusinessesUseCase)
      : super(const HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final userResult = await _getUserUseCase(const NoParams());
    final businessResult = await _getBusinessesUseCase(const NoParams());

    userResult.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (user) => businessResult.fold(
        (failure) => emit(HomeFailure(failure.message)),
        (businesses) {
          final userWithCount = UserInfoEntity(
            id: user.id,
            name: user.name,
            email: user.email,
            avatar: user.avatar,
            phone: user.phone,
            businessCount: businesses.length,
          );
          emit(HomeLoaded(user: userWithCount, businesses: businesses));
        },
      ),
    );
  }
}