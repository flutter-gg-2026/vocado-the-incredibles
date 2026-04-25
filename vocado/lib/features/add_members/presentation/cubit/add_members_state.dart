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

  const AddMembersSuccessState(this.members);

  @override
  List<Object?> get props => [members];
}

class AddMembersErrorState extends AddMembersState {
  final String message;

  const AddMembersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class AddMembersGroupCreatedState extends AddMembersState {}