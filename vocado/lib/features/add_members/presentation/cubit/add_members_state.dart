import 'package:equatable/equatable.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';

sealed class AddMembersState extends Equatable {
  const AddMembersState();

  @override
  List<Object?> get props => [];
}

class AddMembersInitialState extends AddMembersState {}

class AddMembersLoadingState extends AddMembersState {}

class AddMembersCreatingState extends AddMembersState {}


class AddMembersSuccessState extends AddMembersState {
  final List<AddMembersEntity> members;
  final List<AddMembersEntity> selectedMembers;

  const AddMembersSuccessState({
    required this.members,
    this.selectedMembers = const [],
  });

  @override
  List<Object?> get props => [members, selectedMembers];
}

class AddMembersConfirmedState extends AddMembersState {
  final List<AddMembersEntity> confirmedMembers;
  final List<AddMembersEntity> members;

  const AddMembersConfirmedState({
    required this.confirmedMembers,
    required this.members,
  });

  @override
  List<Object?> get props => [confirmedMembers, members];
}

class AddMembersErrorState extends AddMembersState {
  final String message;

  const AddMembersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class AddMembersGroupCreatedState extends AddMembersState {}

