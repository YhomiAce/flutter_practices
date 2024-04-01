import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modular_ui/modular_ui.dart';

class GoLoginPage extends StatefulWidget {
  const GoLoginPage({super.key});

  @override
  State<GoLoginPage> createState() => _GoLoginPageState();
}

class _GoLoginPageState extends State<GoLoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MUISignInCard(
          emailController: emailController,
          passwordController: passwordController,
          onSignInPressed: () async {
            context.goNamed('/home');
          },
          onRegisterNow: () {},
        ),
      ),
    );
  }
}
