import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vocado/core/di/configure_dependencies.dart';
import 'package:vocado/core/services/serviceUser.dart';
import 'package:vocado/core/widgets/nav_bar.dart';
import 'package:vocado/features/add_members/presentation/cubit/add_members_cubit.dart';
import 'package:vocado/features/add_members/presentation/pages/add_members_feature_screen.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_cubit.dart';
import 'package:vocado/features/admin_dashboard/presentation/pages/admin_dashboard_feature_screen.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vocado/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:vocado/features/task_create/presentation/cubit/task_create_cubit.dart';
import 'package:vocado/features/task_create/presentation/pages/task_create_feature_screen.dart';
import 'package:vocado/features/user_task/presentation/cubit/user_task_cubit.dart';
import 'package:vocado/features/user_task/presentation/pages/user_task_feature_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/view_members/presentation/pages/view_members_feature_screen.dart';
import 'package:vocado/features/view_members/presentation/cubit/view_members_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.auth,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavBar(
          navigationShell: navigationShell,
          serviceUser: GetIt.I.get(),
        ),
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
                path: Routes.addMembers,
                builder: (context, state) => BlocProvider(
                  create: (context) => AddMembersCubit(GetIt.I.get()),
                  child: const AddMembersFeatureScreen(),
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

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                redirect: (context, state) {
                  final serviceUser = getIt<ServiceUser>();
                  if (!serviceUser.isLoggedIn) return Routes.auth;
                  return null;
                },
                builder: (context, state) => BlocProvider(
                  create: (context) => getIt<ProfileCubit>(),
                  child: const ProfileFeatureScreen(),
                ),
              ),
            ],
          ),
        ],
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

      GoRoute(
        path: Routes.viewMembers,
        builder: (context, state) => BlocProvider(
          create: (context) => ViewMembersCubit(GetIt.I.get()),
          child: const ViewMembersFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
