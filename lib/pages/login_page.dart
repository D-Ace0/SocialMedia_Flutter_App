import 'package:flutter/material.dart';
import 'package:socialmediaapp/widgets/my_button.dart';
import 'package:socialmediaapp/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 24),

              // app name
              Text("M I N I M A L", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 24),
              // email textfield
              MyTextfield(
                controller: emailController,
                obsecure: false,
                hint: "Email",
              ),
              const SizedBox(height: 10),

              // password textfield
              MyTextfield(
                controller: passwordController,
                obsecure: true,
                hint: "Password",
              ),
              const SizedBox(height: 10),

              // forgot pass
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // signin button
              MyButton(text: "Sign In", onTap: () {}),
              const SizedBox(height: 24),

              // don't havce account, regsiter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
