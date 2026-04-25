import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isLogin = useState(true);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();

    final role = useState('user');

    void handleAuth() {
      if (isLogin.value) {
        context.read<AuthCubit>().loginMethod(
          emailController.text,
          passwordController.text,
        );
      } else {
        context.read<AuthCubit>().signUpMethod(
          emailController.text,
          passwordController.text,
          role.value,
          nameController.text,
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success'),
                      backgroundColor: Colors.green,
                    ),
                  );
                   emailController.clear();
                   passwordController.clear();
                   nameController.clear();

                  // context.go(Routes.);
                  
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final isBlocLoading = state is AuthLoadingState;
                return Column(
                  children: [
                    Gap(32),

                    Text(
                      isLogin.value ? "Login" : "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Gap(32),

                    // NAME (signup only)
                    if (!isLogin.value)
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),

                    if (!isLogin.value) Gap(16),

                    // EMAIL
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Gap(16),

                    // PASSWORD
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Gap(16),

                    if (!isLogin.value)
                      DropdownButtonFormField<String>(
                        value: role.value,
                        items: [
                          DropdownMenuItem(value: 'user', child: Text("User")),
                          DropdownMenuItem(
                            value: 'admin',
                            child: Text("Admin"),
                          ),
                        ],
                        onChanged: (val) => role.value = val!,
                        decoration: const InputDecoration(
                          labelText: "Role",
                          border: OutlineInputBorder(),
                        ),
                      ),

                    Gap(24),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isBlocLoading ? null : handleAuth,
                        child: isBlocLoading
                            ? const CircularProgressIndicator()
                            : Text(isLogin.value ? "Login" : "Sign Up"),
                      ),
                    ),

                    const Gap(16),

                    // TOGGLE
                    TextButton(
                      onPressed: () {
                        isLogin.value = !isLogin.value;
                        
                      },
                      child: Text(
                        isLogin.value
                            ? "Don't have account? Sign Up"
                            : "Already have account? Login",
                      ),
                    ),

                  Gap(16),

                    IconButton(
                      onPressed: () {
                        context.read<AuthCubit>().logOutMethod();
                      },
                      icon: Icon(Icons.logout),
                    ),
                  Gap(16),

                    IconButton(
                      onPressed: () {
                        context.push(Routes.profile);
                      },
                      icon: Icon(Icons.square, size: 30,),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
