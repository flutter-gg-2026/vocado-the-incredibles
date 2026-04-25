import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/add_members/domain/entities/add_members_entity.dart';
import 'package:vocado/features/add_members/domain/use_cases/add_members_use_case.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_state.dart';

@injectable
class AddMembersCubit extends Cubit<AddMembersState> {
  final AddMembersUseCase _addMembersUseCase;

  final List<AddMembersEntity> selectedMembers = [];

  AddMembersCubit(this._addMembersUseCase) : super(AddMembersInitialState()) {
    getAddMembersMethod();
  }

  Future<void> getAddMembersMethod() async {
    emit(AddMembersLoadingState());

    final result = await _addMembersUseCase.getAddMembers();

    result.when(
      (members) {
        emit(AddMembersSuccessState(members));
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

  print('SELECTED: ${selectedMembers.map((e) => e.name).toList()}');

  if (state is AddMembersSuccessState) {
    final currentState = state as AddMembersSuccessState;

    emit(AddMembersLoadingState());
    emit(AddMembersSuccessState(currentState.members));
  }
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
      (_) async {
        selectedMembers.clear();

        emit(AddMembersGroupCreatedState());

        await getAddMembersMethod();
      },
      (failure) {
        emit(AddMembersErrorState(failure.message));
      },
    );
  }
}