import 'package:flutter/material.dart';
import 'package:socialmediaapp/pages/login_page.dart';
import 'package:socialmediaapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleMethod() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(onTap: toggleMethod)
        : RegisterPage(onTap: toggleMethod);
  }
}
