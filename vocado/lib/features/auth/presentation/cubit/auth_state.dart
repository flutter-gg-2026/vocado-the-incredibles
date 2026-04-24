import 'package:equatable/equatable.dart';
import 'package:vocado/core/common/entities/auth_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}


class AuthInitialState extends AuthState {}
class AuthSuccessState extends AuthState {
  final AuthEntity? user;
  const AuthSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}


class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

