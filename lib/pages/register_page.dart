import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/helper_functions/helper_functions.dart';
import 'package:socialmediaapp/widgets/my_button.dart';
import 'package:socialmediaapp/widgets/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  // sign up method
  void signUpMethod() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    if (passwordConfirmController.text != passwordController.text) {
      Navigator.pop(context);
      displayMessage(context, "Passwords do not match");
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        Navigator.pop(context);
        displayMessage(context, "Account Created Successfully");
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessage(context, e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
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
                MyButton(text: "Sign Up", onTap: signUpMethod),
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
                      onTap: widget.onTap,
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
