import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Container(
        color: Color.fromRGBO(223, 88, 90, 1.0),
        child: Center(child: Text('Profile_View')),
      ),
    );
  }
}