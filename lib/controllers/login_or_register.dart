import 'package:flutter/material.dart';
import 'package:unilink_project/views/authentication/login.dart';
import 'package:unilink_project/views/authentication/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return Login(
        onTap: tooglePages,
      );
    } else {
      return Register(
        onTap: tooglePages,
      );
    }
  }
}
