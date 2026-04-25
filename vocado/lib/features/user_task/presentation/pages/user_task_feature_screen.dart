
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/user_task/presentation/cubit/user_task_cubit.dart';
import 'package:vocado/features/user_task/presentation/cubit/user_task_state.dart';
import 'package:vocado/features/user_task/presentation/widgets/empty_tasks_card.dart';
import 'package:vocado/features/user_task/presentation/widgets/header_widget.dart';
import 'package:vocado/features/user_task/presentation/widgets/late_task_widget.dart';
import 'package:vocado/features/user_task/presentation/widgets/new_task_widget.dart';
import 'package:vocado/features/user_task/presentation/widgets/progress_task_tile.dart';
import 'package:vocado/features/user_task/presentation/widgets/section_header.dart';

class UserTaskFeatureScreen extends StatelessWidget {
  const UserTaskFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FF),
      body: SafeArea(
        child: BlocBuilder<UserTaskCubit, UserTaskState>(
          builder: (context, state) {
            if (state is UserTaskLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserTaskErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is UserTaskSuccessState) {
              final allTask = state.tasks;
              final now = DateTime.now();

              final name = allTask.isNotEmpty ? allTask : 'User';

              final newTasks = allTask
                  .where(
                    (task) =>
                        task.status == 'Pending' &&
                        (DateTime.parse(task.dueDate).isAfter(now) ||
                            DateUtils.isSameDay(
                              DateTime.parse(task.dueDate),
                              now,
                            )),
                  )
                  .toList();

              final lateTasks = allTask
                  .where(
                    (task) =>
                        task.status == 'Pending' &&
                        DateTime.parse(task.dueDate).isBefore(now) &&
                        !DateUtils.isSameDay(
                          DateTime.parse(task.dueDate),
                          now,
                        ),
                  )
                  .toList();

              final progressTasks = allTask
                  .where((task) => task.status == 'Completed')
                  .toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(),

                    const Gap(36),

                    Text(
                      "welcome",
                      style: const TextStyle(
                        color: Color(0xff102A63),
                        fontSize: 29,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Gap(34),

                    SectionHeader(
                      title: "${newTasks.length} New",
                      subtitle: "tasks today",
                    ),

                    const Gap(18),

                    SizedBox(
                      height: 190,
                      child: newTasks.isEmpty
                          ?  EmptyTasksCard(text: "No new tasks")
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: newTasks.length,
                              separatorBuilder: (_, __) => const Gap(16),
                              itemBuilder: (context, index) {
                                return NewTaskCard(task: newTasks[index]);
                              },
                            ),
                    ),

                    const Gap(34),

                    SectionHeader(
                      title: "Late",
                      count: lateTasks.length,
                    ),

                    const Gap(18),

                    SizedBox(
                      height: 250,
                      child: lateTasks.isEmpty
                          ?  EmptyTasksCard(text: "No late tasks")
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: lateTasks.length,
                              separatorBuilder: (_, __) => const Gap(16),
                              itemBuilder: (context, index) {
                                return LateTaskCard(task: lateTasks[index]);
                              },
                            ),
                    ),

                    const Gap(34),

                    SectionHeader(
                      title: "Completed",
                      count: progressTasks.length,
                    ),

                    const Gap(18),

                    progressTasks.isEmpty
                        ?  EmptyTasksCard(text: "No completed tasks")
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: progressTasks.length,
                            separatorBuilder: (_, __) => const Gap(16),
                            itemBuilder: (context, index) {
                              return ProgressTaskTile(
                                task: progressTasks[index],
                              );
                            },
                          ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}