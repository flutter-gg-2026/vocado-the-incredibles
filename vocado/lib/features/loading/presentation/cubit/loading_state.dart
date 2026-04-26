import 'package:equatable/equatable.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingInitialState extends LoadingState {}

class LoadingSuccessState extends LoadingState {
  final AuthEntity user;

  const LoadingSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoadingErrorState extends LoadingState {
  final String message;
  const LoadingErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
