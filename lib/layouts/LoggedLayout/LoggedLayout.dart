import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../pages/Home/Home.dart';
import '../../pages/Login/Login.dart';
import '../../pages/Profile/Profile.dart';

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
    username != null ? setState(() {this.username = username;}) : '';
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
                  ClipOval(
                    child:
                      Image.asset(
                        "assets/Images/user.png",
                        height: 80,
                        width: 100,
                      )
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
              title: const Text('Profile'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile())),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
            ),
          ],
        ),
      ),
    );
  }
}