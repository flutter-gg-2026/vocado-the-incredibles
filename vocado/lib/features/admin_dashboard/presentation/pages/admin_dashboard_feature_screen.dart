import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/admin_dashboard/presentation/cubit/admin_dashboard_cubit.dart';

class AdminDashboardFeatureScreen extends StatelessWidget {
  const AdminDashboardFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<AdminDashboardCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('AdminDashboard Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
