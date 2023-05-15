import 'package:flutter/material.dart';

class LoggedLayout extends StatelessWidget {
  const LoggedLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.orange,
              ),
              child: Column(
                children: [
                  Text(
                    'Esquilo APP',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.person),
                  Text(
                    '{{Username}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Home'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

}