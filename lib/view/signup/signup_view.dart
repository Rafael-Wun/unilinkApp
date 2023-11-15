import 'package:flutter/material.dart';
import 'package:unilink_project/view/signup/widget/fc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton (
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              FirstCreate(),
            ],
          ),
        ),
      ),
    );
  }
}
