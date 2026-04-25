import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/domain/use_cases/add_members_use_case.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_state.dart';

@injectable
class AddMembersCubit extends Cubit<AddMembersState> {
  final AddMembersUseCase _addMembersUseCase;

  final List<AddMembersEntity> selectedMembers = [];
  List<AddMembersEntity> lastMembers = [];

  AddMembersCubit(this._addMembersUseCase) : super(AddMembersInitialState()) {
    getAddMembersMethod();
  }

  Future<void> getAddMembersMethod() async {
    emit(AddMembersLoadingState());

    final result = await _addMembersUseCase.getAddMembers();

    result.when(
      (members) {

        lastMembers = members;

 
        emit(
          AddMembersSuccessState(
            members: members,
            selectedMembers: List.from(selectedMembers),
          ),
        );
      },
      (failure) {
        emit(AddMembersErrorState(failure.message));
      },
    );
  }

  void toggleMember(AddMembersEntity member) {
    if (selectedMembers.contains(member)) {
      selectedMembers.remove(member);
    } else {
      selectedMembers.add(member);
    }

    emit(
      AddMembersSuccessState(
        members: List.from(lastMembers),
        selectedMembers: List.from(selectedMembers),
      ),
    );
  }

  Future<void> confirmMembers() async {
    if (selectedMembers.isEmpty) {
      emit(const AddMembersErrorState('Please select at least one member'));
      return;
    }

    emit(AddMembersCreatingState());

    final ids = selectedMembers.map((e) => e.id).toList();

    final result = await _addMembersUseCase.createGroupMembers(ids);

    result.when(
      (success) {
        final confirmed = List<AddMembersEntity>.from(selectedMembers);
        final currentMembers = lastMembers;

        emit(
          AddMembersConfirmedState(
            confirmedMembers: confirmed,
            members: currentMembers,
          ),
        );
      },
      (error) {
        emit(AddMembersErrorState(error.message));
      },
    );
  }

  void removeSelectedMember(AddMembersEntity member) {
    selectedMembers.remove(member);

    emit(
      AddMembersConfirmedState(
        confirmedMembers: List.from(selectedMembers),
        members: lastMembers,
      ),
    );
  }
}
