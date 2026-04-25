import 'package:equatable/equatable.dart';
import 'package:vocado/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}
class ProfileLoadingState extends ProfileState {}
class ProfileSuccessState extends ProfileState {

  final ProfileEntity profile;
  const ProfileSuccessState(this.profile);

  @override
  List<Object?> get props => [profile];
}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
