import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/use_cases/recorder_use_case.dart';
import 'package:vocado/features/task_create/sub/recorder/presentation/cubit/recorder_state.dart';

class RecorderCubit extends Cubit<RecorderState> {
  final RecorderUseCase _recorderUseCase;

  RecorderCubit(this._recorderUseCase) : super(RecorderInitialState());

  Future<void> pressButton(bool isRecording) =>
      isRecording ? stopRecord() : startRecord();

  Future<void> startRecord() async {
    final result = await _recorderUseCase.startRecording();
    result.when(
      (success) {
        emit(RecorderSuccessState(isRecording: true));
      },
      (whenError) {
        emit(RecorderErrorState(message: whenError.message));
      },
    );
  }

  Future<void> stopRecord() async {
    final result = await _recorderUseCase.stopRecording();
    result.when(
      (success) {
        emit(RecorderSuccessState(isRecording: false, record: success));
      },
      (whenError) {
        emit(RecorderErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
