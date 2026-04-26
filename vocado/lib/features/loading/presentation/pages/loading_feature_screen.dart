import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:vocado/features/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<LoadingCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Loading Feature Screen')),
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          switch (state) {
            case LoadingSuccessState _:
              context.go(Routes.addMembers);
            case LoadingErrorState _:
              context.go(Routes.auth);
          }
        },
        child: Center(child: LoadingWidget()),
      ),
    );
  }
}
