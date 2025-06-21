import 'package:flutter/material.dart';
import 'package:recipe_app/pages/loginpage.dart';
import 'package:recipe_app/pages/registerpage.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(onTap: togglePage);
    } else {
      return Registerpage(onTap: togglePage);
    }
  }
}
