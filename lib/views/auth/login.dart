import 'package:flutter/material.dart';
import 'package:unilink_project/controllers/auth_controller.dart';
import 'package:unilink_project/main.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';
import 'forgot_password_page.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _loginController = AuthController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 192,
                    width: 192,
                  ),
                  const SizedBox(height: 48.0),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    border: true,
                  ),
                  const SizedBox(height: 12.0),
                  CustomTextField(
                    controller: _passwordController,
                    obsecureText: true,
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    border: true,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 64.0),
                  ElevatedButton(
                    onPressed: () => _loginController.signUserIn(
                        context,
                        _emailController.text.trim(),
                        _passwordController.text.trim()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(223, 88, 90, 1.0),
                    ),
                    child: Container(
                      width: deviceWidth - 48,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          ' Register now!',
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
