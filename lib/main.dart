import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/auth/auth.dart';
import 'package:socialmediaapp/auth/login_or_register.dart';
import 'package:socialmediaapp/firebase_options.dart';
import 'package:socialmediaapp/pages/home_page.dart';
import 'package:socialmediaapp/pages/profile_page.dart';
import 'package:socialmediaapp/pages/users_page.dart';
import 'package:socialmediaapp/theme/dark_mode.dart';
import 'package:socialmediaapp/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AuthPage(),
      theme: darkMode,
      darkTheme: lightMode,
      routes: {
        '/home_page': (context) => HomePage(),
        '/login_register_page': (context) => const LoginOrRegister(),
        'profile_page': (context) => const ProfilePage(),
        'users_page': (context) => const UsersPage(),
      },
    );
  }
}
