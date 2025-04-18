import 'package:flutter/material.dart';
import 'package:socialmediaapp/pages/login_page.dart';
import 'package:socialmediaapp/theme/dark_mode.dart';
import 'package:socialmediaapp/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
      theme: darkMode,
      darkTheme: lightMode,
    );
  }
}
