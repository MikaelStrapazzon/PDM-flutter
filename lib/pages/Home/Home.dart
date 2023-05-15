import 'package:PDM_flutter/layouts/LoggedLayout/LoggedLayout.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String id = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child: Image.asset("assets/Images/esquilo.jpg"));
  }

}