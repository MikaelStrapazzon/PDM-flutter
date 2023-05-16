import 'package:flutter/material.dart';

import '../../layouts/LoggedLayout/LoggedLayout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String id = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child: Image.asset("assets/Images/esquilo.jpg"));
  }

}