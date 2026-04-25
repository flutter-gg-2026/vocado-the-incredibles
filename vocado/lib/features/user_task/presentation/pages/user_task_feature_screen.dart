import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/user_task/domain/entities/user_task_entity.dart';
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
              final newTasks = state.tasks
                  .where((task) => task.status == 'new')
                  .toList();

              final lateTasks = state.tasks
                  .where((task) => task.status == 'late')
                  .toList();

              final progressTasks = state.tasks
                  .where((task) => task.status == 'in_progress')
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

                    const Center(
                      child: Text(
                        "Hello, Rasha",
                        style: TextStyle(
                          color: Color(0xff102A63),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Gap(34),
                    SectionHeader(
                      title: "${newTasks.length} New",
                      subtitle: "tasks today",
                      onViewAllTap: () {
                        //!-------------------------
                        // context.push(

                        //   // Routes.
                        //   // extra: {'title': 'New Tasks', 'tasks': newTasks},
                        // );
                      },
                    ),

                    const Gap(18),

                    SizedBox(
                      height: 190,
                      child: newTasks.isEmpty
                          ? const EmptyTasksCard(text: "No new tasks")
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
                      onViewAllTap: () {
                        //!-----------------------------
                        // context.push(
                        //   Routes.allTasks,
                        //   extra: {'title': 'Late Tasks', 'tasks': lateTasks},
                        // );
                      },
                    ),
                    const Gap(18),

                    SizedBox(
                      height: 250,
                      child: lateTasks.isEmpty
                          ? const EmptyTasksCard(text: "No late tasks")
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
                      title: "Late",
                      count: lateTasks.length,
                      onViewAllTap: () {

                        //!--------------------------
                        // context.push(
                        //   Routes.allTasks,
                        //   extra: {'title': 'Late Tasks', 'tasks': lateTasks},
                        // );
                      },
                    ),
                    const Gap(18),

                    progressTasks.isEmpty
                        ? const EmptyTasksCard(text: "No progress tasks")
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
