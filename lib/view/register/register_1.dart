import 'package:flutter/material.dart';
import 'package:unilink_project/view/register/register_2.dart';
import 'package:unilink_project/view/widgets/c_textfield.dart';

class RegisterFirst extends StatefulWidget {
  const RegisterFirst({super.key});

  @override
  State<RegisterFirst> createState() => RegisterFirstState();
}

class RegisterFirstState extends State<RegisterFirst> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final uNameController = TextEditingController();
  final univController = TextEditingController();
  final bioController = TextEditingController();

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
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomTextField(
                  controller: fNameController,
                  hintText: 'ex: John',
                  obsecureText: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Last Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: lNameController,
                  hintText: 'ex: Doe',
                  obsecureText: true,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Username',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: uNameController,
                  hintText: 'ex: johnDoe_1',
                  obsecureText: true,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'University',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: univController,
                  hintText: 'ex: University of Tarumanagara',
                  obsecureText: true,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                Container(
                  width: 312,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Bio',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: bioController,
                  hintText: 'Describe Yourself',
                  obsecureText: true,
                  keyboardType: TextInputType.text,
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
