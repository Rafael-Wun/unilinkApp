import 'package:flutter/material.dart';
import 'package:unilink_project/main_menu.dart';
import 'package:unilink_project/view/profile/other_profile.dart';
import 'package:unilink_project/view/profile/profile_view.dart';
import 'package:unilink_project/view/signin/signin_view.dart';
import 'package:unilink_project/view/signup/signup_view.dart';

void main() {
  runApp(const MyApp());
}

// late double deviceWidth;
// late double deviceHeight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unilink App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(223, 88, 90, 1.0)),
        useMaterial3: true,
      ),
      // home: MainMenu(),
      home: OtherProfileView(),
    );
  }
}
