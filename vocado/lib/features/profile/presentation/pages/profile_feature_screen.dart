
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_state.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 

class ProfileFeatureScreen extends HookWidget {
  const ProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();

    useEffect(() {
      context.read<ProfileCubit>().getProfileMethod();
      return null; 
    }, const []); 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthCubit>().logOutMethod(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: Colors.red),
              );
            }
            if (state is ProfileSuccessState) {
              nameController.text = state.profile.name ?? '';
            }
          },
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is ProfileSuccessState) {
              final user = state.profile;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Gap(16),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: const OutlineInputBorder(),
                      hintText: user.email,
                    ),
                  ),
                  const Gap(16),
                  Text("Role: ${user.role}", style: const TextStyle(fontSize: 16)),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ProfileCubit>().updateProfileMethod(nameController.text);
                      },
                      child: const Text("Update Profile"),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}


