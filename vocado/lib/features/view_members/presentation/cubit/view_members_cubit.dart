import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/features/view_members/domain/use_cases/view_members_use_case.dart';
import 'package:vocado/features/view_members/presentation/cubit/view_members_state.dart';

@injectable
class ViewMembersCubit extends Cubit<ViewMembersState> {
  final ViewMembersUseCase _useCase;

  ViewMembersCubit(this._useCase) : super(ViewMembersInitialState()) {
    getViewMembers();
  }

  Future<void> getViewMembers() async {
    emit(ViewMembersLoadingState());

    final result = await _useCase.getViewMembers();

    result.when(
      (success) {
        emit(ViewMembersSuccessState(members: success));
      },
      (failure) {
        emit(ViewMembersErrorState(message: failure.message));
      },
    );
  }
}