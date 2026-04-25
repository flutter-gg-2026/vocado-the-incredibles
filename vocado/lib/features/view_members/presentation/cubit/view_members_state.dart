import 'package:equatable/equatable.dart';
import 'package:vocado/features/view_members/domain/entities/view_members_entity.dart';

abstract class ViewMembersState extends Equatable {
  const ViewMembersState();

  @override
  List<Object?> get props => [];
}

class ViewMembersInitialState extends ViewMembersState {}

class ViewMembersLoadingState extends ViewMembersState {}

class ViewMembersSuccessState extends ViewMembersState {
  final List<ViewMembersEntity> members;

  const ViewMembersSuccessState({required this.members});

  @override
  List<Object?> get props => [members];
}

class ViewMembersErrorState extends ViewMembersState {
  final String message;

  const ViewMembersErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}