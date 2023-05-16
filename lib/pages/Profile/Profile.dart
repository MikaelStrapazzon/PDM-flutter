import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../layouts/LoggedLayout/LoggedLayout.dart';

class Profile extends StatefulWidget {
  static String id = '/ProfilePage';

  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "username";
  String password = "*********";

  @override
  void initState() {
    super.initState();
    getSession();
  }

  Future<void> getSession() async {
    final username = await SessionManager().get("username");
    username != null ? setState(() {this.username = username.toString();}) : '';

    final password = await SessionManager().get("password");
    password != null ? setState(() {this.password = password.toString();}) : '';
  }

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child:
      SizedBox(
        width: double.infinity,
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/Images/user.png"),
              ),
              const SizedBox(height: 60),
              const Text(
                "Nome:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Text(
                username,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Senha:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Text(
                password,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
      ),
    );
  }
}