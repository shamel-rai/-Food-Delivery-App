import 'package:flutter/material.dart';
import 'package:recipe_app/components/my_button.dart';
import 'package:recipe_app/components/textfield.dart';

class Registerpage extends StatefulWidget {
  final void Function()? onTap;

  Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Registerpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(height: 25),

            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(height: 25),

            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),

            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),

            MyTextfield(
              controller: passwordController,
              hintText: "Comfirm Password",
              obsecureText: true,
            ),

            SizedBox(height: 16),

            SizedBox(height: 25),

            MyButton(onTap: () {}, text: "Sign-Up"),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
