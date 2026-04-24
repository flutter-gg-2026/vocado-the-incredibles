import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/features/task_create/sub/recorder/presentation/cubit/recorder_cubit.dart';
import 'package:vocado/features/task_create/sub/recorder/presentation/cubit/recorder_state.dart';

class RecorderFeatureWidget extends StatelessWidget {
  final Function(File)? onCallBack;
  final double? size;

  const RecorderFeatureWidget({super.key, this.onCallBack, this.size});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecorderCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<RecorderCubit>();
          return BlocConsumer<RecorderCubit, RecorderState>(
            listener: (context, state) {
              if (state is RecorderSuccessState) {
                if (state.isRecording) {
                  context.showSnackBar('Recording Started');
                }
                if (!state.isRecording && onCallBack != null) {
                  onCallBack!(state.record!.path);
                }
              }
              if (state is RecorderErrorState) {
                context.showSnackBar(state.message, isError: true);
              }
            },
            builder: (context, state) {
              return IconButton.filled(
                onPressed: () => cubit.pressButton(
                  state is RecorderSuccessState ? state.isRecording : false,
                ),
                style: ButtonStyle(
                  backgroundColor: .all(
                    state is RecorderSuccessState && state.isRecording
                        ? Colors.green
                        : null,
                  ),
                  minimumSize: .all(.fromRadius((size ?? 25) * 0.8)),
                  iconSize: .all(size ?? 25),
                ),

                icon: Icon(Icons.mic_none),
              );
            },
          );
        },
      ),
    );
  }
}
