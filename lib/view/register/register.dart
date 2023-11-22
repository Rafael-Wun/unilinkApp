import 'package:flutter/material.dart';
import 'package:unilink_project/view/login/login.dart';
import 'package:unilink_project/view/widgets/c_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final universityController = TextEditingController();
  final bioController = TextEditingController();

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
                    hintText: 'Min. 8 characters',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Confirm Password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm your password',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Fullname',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    controller: fullNameController,
                    hintText: 'John Doe',
                    obsecureText: true,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'University',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    controller: universityController,
                    hintText: 'Enter your university',
                    obsecureText: true,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 312,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Bio',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    controller: bioController,
                    hintText: 'Describe yourself',
                    obsecureText: true,
                    keyboardType: TextInputType.name,
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
                            'Register',
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
                        'Already Have an Account?',
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Login Now!',
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
