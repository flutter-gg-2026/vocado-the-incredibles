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
    TextEditingController emailControuller = useTextEditingController();
    TextEditingController passwordControuller = useTextEditingController();
    TextEditingController nameControuller = useTextEditingController();
    TextEditingController roulControuller = useTextEditingController();
    final _ = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Feature Screen')),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text('email: '),
                TextField(
                  controller: emailControuller,
                ),
                Text('password: '),
                TextField(
                  controller: passwordControuller,
                ),
                 Text('name: '),
                TextField(
                  controller: nameControuller,
                ),
                Text('roule: '),
                TextField(
                  controller: roulControuller,
                ),
                Gap(100,),
                ElevatedButton(onPressed: (){
                  // context.read<AuthCubit>().signUpMethod(emailControuller.text, passwordControuller.text, roulControuller.text, nameControuller.text);
                  context.read()<AuthCubit>().loginMethod(emailControuller.text, passwordControuller.text);
                }, child: Text('go'))
              ],
            ),
          );
        },
      ),
    );
  }
}
