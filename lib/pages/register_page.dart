import 'package:flutter/material.dart';
import 'package:socialmediaapp/widgets/my_button.dart';
import 'package:socialmediaapp/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  RegisterPage({super.key});

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
                controller: usernameController,
                obsecure: false,
                hint: "Username",
              ),
              const SizedBox(height: 10),

              //usename textfield
              MyTextfield(
                controller: emailController,
                obsecure: false,
                hint: "Email",
              ),
              const SizedBox(height: 10),

              // password textfield
              MyTextfield(
                controller: emailController,
                obsecure: true,
                hint: "Password",
              ),
              const SizedBox(height: 10),

              // confirm password textfield
              MyTextfield(
                controller: passwordConfirmController,
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
              MyButton(text: "Sign Up", onTap: () {}),

              // don't havce account, regsiter
            ],
          ),
        ),
      ),
    );
  }
}
