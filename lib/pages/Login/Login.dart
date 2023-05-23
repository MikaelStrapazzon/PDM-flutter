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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nome:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Senha:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ]
              ),
          ),
          const SizedBox(height: 20),
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