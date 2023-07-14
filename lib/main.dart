import 'package:birthday_tracker_client/models/birthday.dart';
import 'package:birthday_tracker_client/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<List<Birthday>>(List.empty(growable: true));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
