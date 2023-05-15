import 'package:flutter/material.dart';

import 'pages/Login/Login.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => const Login(),
      },
    );
  }
}
