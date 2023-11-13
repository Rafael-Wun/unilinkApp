import 'package:flutter/material.dart';
import 'package:unilink_project/view/create_acc/widget/sc.dart';

class FirstCreate extends StatelessWidget {
  const FirstCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _fname(),
          _boxfname(),
          _lname(),
          _boxlname(),
          _univ(),
          _boxuniv(),
          _semes(),
          _boxsemes(),
          _bio(),
          _boxbio(),
          _continue()
        ],
      ),
    );
  }

  Widget _fname() {
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

  Widget _boxfname() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "First Name",
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

  Widget _lname() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 280),
        child: Text(
          "Last Name",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxlname() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Last Name",
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

  Widget _univ() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 280),
        child: Text(
          "University",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxuniv() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "University",
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

  Widget _semes() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25, right: 285),
        child: Text(
          "Semester",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxsemes() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Semester",
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

  Widget _bio() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 25,right: 340),
        child: Text(
          "Bio",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _boxbio() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Write a little about yourself",
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

  Widget _continue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: SecondCreate(),
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
