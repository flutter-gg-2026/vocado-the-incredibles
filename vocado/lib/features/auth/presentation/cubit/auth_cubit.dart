import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/services/service_user.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;
  final ServiceUser _serviceUser;
  AuthCubit(this._authUseCase,  this._serviceUser): super(AuthInitialState());

Future<void> checkAuth() async {

  if (_serviceUser.isLoggedIn) {
    emit(AuthSuccessState(_serviceUser.currentUser));
  } else {
    emit(AuthInitialState());
  }
}


  Future<void> loginMethod(String email, String password) async {

    emit(AuthLoadingState());
    final result = await _authUseCase.logIn(email,password);
    
    result.when(
      (success) {
        _serviceUser.setUser(success);
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
        _serviceUser.setUser(success);
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
        _serviceUser.signOut();
        _serviceUser.loadSession();
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
