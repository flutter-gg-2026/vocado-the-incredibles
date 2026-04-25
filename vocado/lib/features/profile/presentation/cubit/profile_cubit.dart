import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/services/service_user.dart';
import 'package:vocado/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_state.dart';
@injectable

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;
   final ServiceUser _serviceUser;

  ProfileCubit(this._profileUseCase, this._serviceUser) : super(ProfileInitialState());

  Future<void> getProfileMethod() async {
    emit(ProfileLoadingState());

      if (!_serviceUser.isLoggedIn) {
    emit(ProfileErrorState(message: "User not logged in"));
    return;
  }

    try {
    final userId = _serviceUser.currentUser!.id;
    final result = await _profileUseCase.getProfile(userId);

    result.when(
      (success) {
        emit(ProfileSuccessState(success));
      },
      (whenError) {
        emit(ProfileErrorState(message: whenError.message));
      },
    );
  } catch (e) {
    emit(ProfileErrorState(message: e.toString()));
  }
 }
   

Future<void> updateProfileMethod(String name) async {
  final userId = _serviceUser.currentUser!.id;

  final result = await _profileUseCase.updateProfile(name, userId);

  result.when(
    (success) => emit(ProfileSuccessState(success)),
    (error) => emit(ProfileErrorState(message: error.message)),
  );
}

  @override
  Future<void> close() {
    return super.close();
  }
}
