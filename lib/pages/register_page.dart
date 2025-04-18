import 'package:flutter/material.dart';
import 'package:socialmediaapp/widgets/my_button.dart';
import 'package:socialmediaapp/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Expanded(
        child: Center(
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
                  controller: passwordController,
                  obsecure: true,
                  hint: "Password",
                ),
                const SizedBox(height: 10),

                // confirm password textfield
                MyTextfield(
                  controller: passwordConfirmController,
                  obsecure: true,
                  hint: "Confirm Password",
                ),
                const SizedBox(height: 24),

                // signin button
                MyButton(text: "Sign Up", onTap: () {}),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // don't havce account, regsiter
              ],
            ),
          ),
        ),
      ),
    );
  }
}
