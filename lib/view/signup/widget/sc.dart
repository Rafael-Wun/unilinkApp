import 'package:flutter/material.dart';

class SecondCreate extends StatefulWidget {
  const SecondCreate({super.key});

  @override
  State<SecondCreate> createState() => _SecondCreateState();
}

class _SecondCreateState extends State<SecondCreate> {
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loggedIn = false;

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    final password = _passController.text;
    final email = _emailController.text;

    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (_) => MainMenu(password: password, email: email),
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _email(),
          _boxemail(),
          _pw(),
          _boxpw(),
          _Cpw(),
          _boxCpw(),
          _signup()
        ],
      ),
    );
  }

  Widget _email() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 270),
        child: Text(
          "First Name",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxemail() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "UniLink@gmail.com",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pw() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 270),
        child: Text(
          "Password",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxpw() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Min. 8 characters",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Cpw() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 270),
        child: Text(
          "Confirm Password",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxCpw() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Min. 8 characters",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signup() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _validate,
            child: Text(
              'Continue',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.red,
              padding: EdgeInsets.fromLTRB(56, 14, 56, 14),
            ),
          ),
        ]
    );
  }
}
