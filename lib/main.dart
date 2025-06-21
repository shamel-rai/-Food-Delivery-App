import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/authentication/login_or_register.dart';
import 'package:recipe_app/pages/loginpage.dart';
import 'package:recipe_app/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
