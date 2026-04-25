import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vocado/core/widgets/nav_bar.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_cubit.dart';
import 'package:vocado/features/admin_dashboard/presentation/pages/admin_dashboard_feature_screen.dart';
import 'package:vocado/features/task_create/presentation/cubit/task_create_cubit.dart';
import 'package:vocado/features/task_create/presentation/pages/task_create_feature_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/add_members/presentation/pages/add_members_feature_screen.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart';
import 'package:vocado/features/user_task/presentation/pages/user_task_feature_screen.dart';
import 'package:vocado/features/user_task/presentation/cubit/user_task_cubit.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.taskCreate,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.addMembers,
        builder: (context, state) => BlocProvider(
          create: (context) => AddMembersCubit(GetIt.I.get()),
          child: const AddMembersFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.userTask,
        builder: (context, state) => BlocProvider(
          create: (context) => UserTaskCubit(GetIt.I.get()),
          child: const UserTaskFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavBar(navigationShell: navigationShell),

        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.taskCreate,
                builder: (context, state) => BlocProvider(
                  create: (context) => TaskCreateCubit(GetIt.I.get()),
                  child: const TaskCreateFeatureScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminDashboard,
                builder: (context, state) => BlocProvider(
                  create: (context) => AdminDashboardCubit(GetIt.I.get()),
                  child: const AdminDashboardFeatureScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
