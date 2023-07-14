import 'package:birthday_tracker_client/screens/login.dart';
import 'package:flutter/material.dart';

class DrawerFragment extends StatelessWidget {
  const DrawerFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Joeweh'),
            accountEmail: Text('joeyqsa@outlook.com'),
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text("Birthdays"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Account"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
