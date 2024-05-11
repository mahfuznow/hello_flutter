import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        const Text("Login Screen"),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
