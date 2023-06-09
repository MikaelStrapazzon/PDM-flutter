import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../pages/Home/Home.dart';
import '../../pages/Login/Login.dart';
import '../../pages/Profile/Profile.dart';
import '../../pages/ChangPassword/ChangePassword.dart';

class LoggedLayout extends StatefulWidget {
  const LoggedLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _LoggedLayoutState createState() => _LoggedLayoutState();
}

class _LoggedLayoutState extends State<LoggedLayout> {
  String username = '';

  @override
  void initState() {
    super.initState();
    getUsernameFromSession();
  }

  Future<void> getUsernameFromSession() async {
    final username = await SessionManager().get("username");
    username != null ? setState(() {this.username = username.toString();}) : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                children: [
                  const Text(
                    'Esquilo APP',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/Images/user.png"),
                  ),
                  Text(
                    username,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Home'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile())),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_rounded),
              title: const Text('Trocar Senha'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePassword())),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => {
                  SessionManager().destroy(),
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
              }
            ),
          ],
        ),
      ),
    );
  }
}