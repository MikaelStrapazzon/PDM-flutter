import 'package:flutter/material.dart';

import '../../layouts/LoggedLayout/LoggedLayout.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static String id = '/ProfilePage';

  @override
  Widget build(BuildContext context) {
    return const LoggedLayout(child: Text("a"));
  }

}