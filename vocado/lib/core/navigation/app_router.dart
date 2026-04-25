import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:vocado/core/di/configure_dependencies.dart';
import 'package:vocado/core/services/serviceUser.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),
    
  GoRoute(
    path: Routes.auth,
    builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
  ),

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

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
