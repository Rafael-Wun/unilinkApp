import 'package:flutter/material.dart';
import 'package:unilink_project/view/register/register_1.dart';
import 'package:unilink_project/view/widgets/c_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.android_rounded,
                    size: 100,
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 56),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'john@gmail.com',
                    obsecureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'min. 8 characters',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 72),
                  GestureDetector(
                    child: Container(
                      width: 312,
                      padding: EdgeInsets.fromLTRB(124.0, 8.0, 16.0, 8.0),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 88, 90, 1.0),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t Have an Account?',
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterFirst()),
                          );
                        },
                        child: const Text(
                          ' Register Now!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
