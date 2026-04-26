
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;
  AuthCubit(this._authUseCase) : super(AuthInitialState());

  Future<void> loginMethod(String email, String password) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.logIn(email, password);

    result.when(
      (success) {
        emit(AuthSuccessState(success));
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  Future<void> signUpMethod(
    String email,
    String password,
    String role,
    String name,
  ) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.signUp(email, password, role, name);
    result.when(
      (success) {
        emit(AuthSuccessState(success));
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
