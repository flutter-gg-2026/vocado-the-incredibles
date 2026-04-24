import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_cubit.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_state.dart';
import 'package:vocado/features/admin_dashboard/presentation/widgets/task_card_widget.dart';

class AdminDashboardFeatureScreen extends StatelessWidget {
  const AdminDashboardFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminDashboardCubit>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Tasks Dashboard'),
              centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                tabAlignment: .start,
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
            SliverToBoxAdapter(
              child: BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
                builder: (context, state) {
                  final successState = state is AdminDashboardSuccessState;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: .stretch,
                      children: [
                        Card(
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              spacing: 10,
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      'Total Tasks',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge,
                                    ),
                                    Icon(Icons.task),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      successState
                                          ? state.tasks.length.toString()
                                          : '0',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Card(
                          color: Colors.cyan,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              spacing: 10,
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      'Completion Percent',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge,
                                    ),
                                    Icon(Icons.percent),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      successState
                                          ? '${(state.tasks.fold(0, (previousValue, element) => (element.completed ? 1 : 0)) / state.tasks.length).toStringAsFixed(2)}%'
                                          : '0',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
              builder: (context, state) {
                return switch (state) {
                  AdminDashboardInitialState _ => SliverToBoxAdapter(
                    child: LoadingWidget(),
                  ),
                  AdminDashboardErrorState _ => SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  ),
                  AdminDashboardSuccessState _ => SliverFillRemaining(
                    child: SafeArea(
                      top: false,
                      child: TabBarView(
                        children: List.generate(4, (index) {
                          final filteredTasks = switch (index) {
                            0 => state.tasks,
                            1 =>
                              state.tasks
                                  .takeWhile(
                                    (value) =>
                                        !value.completed &&
                                        DateTime.now()
                                                .difference(value.dueDate)
                                                .inDays <=
                                            0,
                                  )
                                  .toList(),
                            2 =>
                              state.tasks
                                  .takeWhile(
                                    (value) =>
                                        //!value.completed &&
                                        value.dueDate.isBefore(DateTime.now()),
                                  )
                                  .toList(),
                            3 =>
                              state.tasks
                                  .takeWhile((value) => value.completed)
                                  .toList(),
                            _ => state.tasks,
                          };
                          return filteredTasks.isEmpty
                              ? Center(child: Text('No Tasks Here'))
                              : RefreshIndicator(
                                  onRefresh: () =>
                                      cubit.getAdminDashboardMethod(),
                                  child: ListView.separated(
                                    padding: .all(8),
                                    separatorBuilder: (context, index) =>
                                        Divider(color: Colors.transparent),
                                    itemCount: filteredTasks.length,
                                    itemBuilder: (context, index) =>
                                        TaskCardWidget(
                                          task: filteredTasks[index],
                                        ),
                                  ),
                                );
                        }),
                      ),
                    ),
                  ),
                  _ => SliverToBoxAdapter(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
