import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/core/utils/validators.dart';
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
            onPressed: () {
              context.read<AuthCubit>().logOutMethod();
            },
            icon: const Icon(Icons.logout, color: Colors.red,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is ProfileSuccessState) {
              nameController.text = state.profile.name ?? '';
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Profile updated successfully "),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
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
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: const Icon(Icons.person, size: 50),
                      ),
                    ),
                    const Gap(16),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => Validators.validateRequired(value, fieldName: 'Name'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const Gap(16),
                    Text(
                      "Email: ${user.email}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Gap(16),
                    Text(
                      "Role: ${user.role}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Gap(32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ProfileCubit>().updateProfileMethod(
                            nameController.text,
                          );
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
      ),
    );
  }
}
