import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/task_create/presentation/cubit/task_create_cubit.dart';
import 'package:vocado/features/task_create/presentation/cubit/task_create_state.dart';
import 'package:vocado/features/task_create/presentation/widgets/add_confirmation_widget.dart';
import 'package:vocado/features/task_create/sub/recorder/presentation/pages/recorder_feature_widget.dart';

class TaskCreateFeatureScreen extends StatelessWidget {
  const TaskCreateFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCreateCubit>();

    return Scaffold(
      body: BlocListener<TaskCreateCubit, TaskCreateState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is TaskCreateSuccessState) {
            if (state.isSaved == null) {
              showDialog(
                context: context,
                builder: (context) => AddConfirmationWidget(task: state.task),
              ).then((value) {
                if (value == true) {
                  print('to Save');
                  if (context.mounted) {
                    cubit.saveTask(state.task);
                    context.showLoading();
                  }
                }
              });
            }

            if (state.isSaved == true) {
              context.showSnackBar('Task is created successfully');
            }
          }
          if (state is TaskCreateErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const .all(16),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .end,
                    spacing: 20,
                    children: [
                      Text(
                        'Add A Voice Task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Add your task to your team member by recording your voice.\n pleas make sure to mention a member name that’s you assigned this task for',
                          textAlign: .justify,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: BlocBuilder<TaskCreateCubit, TaskCreateState>(
                      builder: (context, state) {
                        return state is TaskCreateLoadingState
                            ? LoadingWidget(size: 8.sh)
                            : RecorderFeatureWidget(
                                size: 8.sh,
                                onCallBack: (audio) =>
                                    cubit.getTaskCreateMethod(audio),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
