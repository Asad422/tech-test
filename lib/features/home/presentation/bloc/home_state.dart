import 'package:equatable/equatable.dart';
import 'package:tech/features/home/domain/entities/business_entity.dart';
import '../../domain/entities/user_info_entity.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  final UserInfoEntity user;
  final List<BusinessEntity> businesses;

  const HomeLoaded({required this.user, required this.businesses});

  @override
  List<Object?> get props => [user, businesses];
}

final class HomeFailure extends HomeState {
  final String message;
  const HomeFailure(this.message);

  @override
  List<Object?> get props => [message];
}