import 'package:flutter/material.dart';
import 'package:unilink_project/controllers/auth_controller.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerController = AuthController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _universityController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _universityController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Icon(
                    Icons.android_rounded,
                    size: 100,
                  ),
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 56),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your e-mail',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Create your password',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm your password',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Enter your name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _universityController,
                    hintText: 'Enter your university',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _bioController,
                    hintText: 'Describe yourself',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 64.0),
                  ElevatedButton(
                    onPressed: () => _registerController.signUserUp(
                      context,
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _confirmPasswordController.text.trim(),
                      _nameController.text.trim(),
                      _universityController.text.trim(),
                      _bioController.text.trim(),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(223, 88, 90, 1.0),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          ' Login now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
