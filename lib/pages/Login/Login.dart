import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../Home/Home.dart';

import '../../components/Button/Button.dart';

class Login extends StatelessWidget {
  Login({super.key});

  static String id = '/LoginPage';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: ListView(
        children: [
          const Text("LOGIN"),
          const Text("Nome:"),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          const Text("Senha:"),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          Button(
              onPressed: () => {
                SessionManager().set("username", usernameController.value.text),
                SessionManager().set("password", passwordController.value.text),
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()))
              },
              buttonText: "Login"
          )
        ],
      ),
    );
  }
}