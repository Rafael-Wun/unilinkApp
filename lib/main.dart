import 'package:flutter/material.dart';
import 'package:unilink_project/main_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unilink App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(223, 88, 90, 1.0)),
        useMaterial3: true,
      ),
      home: MainMenu(),
    );
  }
}
