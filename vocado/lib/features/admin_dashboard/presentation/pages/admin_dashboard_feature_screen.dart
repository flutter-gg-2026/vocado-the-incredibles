
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/extensions/list_extensions.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/admin_dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_cubit.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_state.dart';
import 'package:vocado/features/admin_dashboard/presentation/widgets/overview_card.dart';
import 'package:vocado/features/admin_dashboard/presentation/widgets/task_card_widget.dart';

class AdminDashboardFeatureScreen extends HookWidget {
  const AdminDashboardFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminDashboardCubit>();
    final ScrollController scrollController = useScrollController();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: BlocListener<AdminDashboardCubit, AdminDashboardState>(
          listener: (context, state) {
            if (state is AdminDashboardErrorState) {
              context.showSnackBar(state.message, isError: true);
            }
          },
          child: RefreshIndicator(
            onRefresh: () => cubit.getAdminDashboardMethod(),
            edgeOffset: 18.sh,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  title: Text('Tasks Dashboard'),
                  centerTitle: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabAlignment: .start,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(child: Text('All')),
                      Tab(child: Text('In progress')),
                      Tab(
                        child: Text(
                          'Late',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Completed',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),

                BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
                  builder: (context, state) {
                    final successState = state is AdminDashboardSuccessState;
                    return switch (state) {
                      AdminDashboardInitialState _ => SliverFillRemaining(
                        child: LoadingWidget(),
                      ),
                      AdminDashboardSuccessState _ => SliverFillRemaining(
                        child: SafeArea(
                          top: false,
                          child: TabBarView(
                            children: List.generate(4, (index) {
                              if (state.tasks.isNotEmpty) {
                                state.tasks[0] = state.tasks[0].copyWith(
                                  completed: true,
                                );
                              }
                              final filteredTasks = _filterList(
                                state.tasks,
                                index,
                              );

                              return filteredTasks.isEmpty
                                  ? Center(child: Text('No Tasks Here'))
                                  : Column(
                                      children: [
                                        if (index == 0)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              spacing: 10,
                                              children: [
                                                OverviewCard(
                                                  title: 'Total Tasks',
                                                  number: successState
                                                      ? state.tasks.length
                                                            .toString()
                                                      : '0',
                                                  icon: Icons.task,
                                                  color: Colors.blueAccent,
                                                ),
                                                OverviewCard(
                                                  title: 'Completion Percent',
                                                  number: successState
                                                      ? '${state.tasks.countIfAvg((task) => task.completed).toStringAsFixed(2)}%'
                                                      : '0',
                                                  icon: Icons.percent,
                                                  color: Colors.cyan,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Divider(height: 0),

                                        Expanded(
                                          child: ListView.separated(
                                            controller: scrollController,
                                            padding: .all(8),
                                            separatorBuilder:
                                                (context, index) => Divider(
                                                  color: Colors.transparent,
                                                  height: 10,
                                                ),
                                            itemCount: filteredTasks.length,
                                            itemBuilder: (context, index) =>
                                                TaskCardWidget(
                                                  task: filteredTasks[index],
                                                  onDelete: () =>
                                                      cubit.removeTask(
                                                        state.tasks,
                                                        filteredTasks[index],
                                                      ),
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                            }),
                          ),
                        ),
                      ),
                      _ => SliverToBoxAdapter(
                        child: Center(child: Text('Error Occurred')),
                      ),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<AdminDashboardEntity> _filterList(
    List<AdminDashboardEntity> allTask,
    int index,
  ) {
    final now = DateTime.now();
    return switch (index) {
      0 => allTask,
      1 =>
        allTask
            .where(
              (value) =>
                  !value.completed &&
                  (now.compareTo(value.dueDate) == -1 ||
                      DateUtils.isSameDay(value.dueDate, now)),
            )
            .toList(),
      2 =>
        allTask
            .where(
              (value) =>
                  !value.completed &&
                  (value.dueDate.isBefore(now) &&
                      !DateUtils.isSameDay(value.dueDate, now)),
            )
            .toList(),
      3 => allTask.where((value) => value.completed).toList(),
      _ => allTask,
    };
  }
}
