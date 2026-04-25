import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_create/sub/recorder/domain/entities/recorder_entity.dart';

abstract class RecorderState extends Equatable {
  
  const RecorderState();

  @override
  List<Object?> get props => [];
}

class RecorderInitialState extends RecorderState {}

class RecorderSuccessState extends RecorderState {
  final bool isRecording;
  final RecorderEntity? record;

  const RecorderSuccessState({required this.isRecording, this.record});

  @override
  List<Object?> get props => [isRecording, record];
}

class RecorderErrorState extends RecorderState {
  final String message;
  const RecorderErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
