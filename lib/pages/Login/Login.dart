import 'package:flutter/material.dart';

import '../../components/Button/Button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static String id = '/LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: ListView(
        children: [
          const Text("LOGIN"),
          const Text("Nome:"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          const Text("Senha:"),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          Button(
              onPressed: () {},
              buttonText: "Login"
          )
        ],
      ),
    );
  }
}