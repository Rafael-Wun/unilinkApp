import 'package:flutter/material.dart';
import 'package:unilink_project/view/widgets/c_textfield.dart';

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({super.key});

  @override
  State<RegisterSecond> createState() => RegisterSecondState();
}

class RegisterSecondState extends State<RegisterSecond> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Create a New Account'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'ex: john@gmail.com',
                  obsecureText: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'min. 8 characters',
                  obsecureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: confirmController,
                  hintText: 'Confirm your password',
                  obsecureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 72),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterSecond()),
                    );
                  },
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
                          'Next',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
