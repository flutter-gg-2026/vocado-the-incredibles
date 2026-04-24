import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedRole = useState<String>('user');
    TextEditingController emailControuller = useTextEditingController();
    TextEditingController passwordControuller = useTextEditingController();
    TextEditingController nameControuller = useTextEditingController();
    final _ = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Feature Screen')),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is AuthErrorState) {
            return Text(state.message);
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Text('email: '),
                TextField(controller: emailControuller),
                Text('password: '),
                TextField(controller: passwordControuller),
                Text('name: '),
                TextField(controller: nameControuller),
                Text('roule: '),
                DropdownButton<String>(
                  value: selectedRole.value,
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'user', child: Text('User')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      selectedRole.value = value;
                    }
                  },
                ),
                Gap(100),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().signUpMethod(
                      emailControuller.text,
                      passwordControuller.text,
                      selectedRole.value,
                      nameControuller.text,
                    );
                    // context.read<AuthCubit>().loginMethod(
                    //   emailControuller.text,
                    //   passwordControuller.text,
                    // );
                  },
                  child: Text('go'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
