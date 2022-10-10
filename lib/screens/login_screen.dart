import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_route_tutorial/cubits/login_cubit.dart';
import 'package:go_route_tutorial/models/category_model.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(context.namedLocation('home'));
              },
              child: const Text('Go to Home'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().login();
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
