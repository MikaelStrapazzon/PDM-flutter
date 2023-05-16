import 'package:flutter/material.dart';

import 'pages/Login/Login.dart';
import 'pages/Home/Home.dart';

void main() {
  runApp(const Routes());
}

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
        Home.id: (context) => const Home(),
      },
    );
  }
}
