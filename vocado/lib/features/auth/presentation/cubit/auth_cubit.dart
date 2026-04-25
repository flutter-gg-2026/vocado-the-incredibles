import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.dart';
import 'package:vocado/core/services/serviceUser.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;
  AuthCubit(this._authUseCase) : super(AuthInitialState());

  final service = GetIt.instance;
  final serviceUser = getIt<ServiceUser>();

Future<void> checkAuth() async {
  final serviceUser = getIt<ServiceUser>();

  if (serviceUser.isLoggedIn) {
    emit(AuthSuccessState(serviceUser.currentUser));
  } else {
    emit(AuthInitialState());
  }
}


  Future<void> loginMethod(String email, String password) async {
    final result = await _authUseCase.logIn(email,password);
    emit(AuthLoadingState());
    result.when(
      (success) {
        serviceUser.setUser(success);
        emit(AuthSuccessState(success));
      },
      (whenError) {

       emit(AuthErrorState(message: whenError.message));
      },
    );
  }



  Future<void> signUpMethod (String email, String password, String role, String name)async {
    emit(AuthLoadingState());
    final result = await _authUseCase.signUp(email, password, role, name);
    result.when(
      (success) {
        serviceUser.setUser(success);
        emit(AuthSuccessState(success));
      },
      (whenError) {
       emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  Future<void> logOutMethod ()async {
    final result = await _authUseCase.logOut();
    emit(AuthInitialState());
    result.when(
      (success) {
        emit(UnauthenticatedState());
        serviceUser.signOut();
        serviceUser.loadSession();
      },
      (whenError) {
       emit(AuthErrorState(message: whenError.message));
      },
    );
  }


  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }

}
