import 'package:flutter/material.dart';
import 'package:unilink_project/main_menu.dart';

void main() {
  runApp(const MyApp());
}

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
      home: MainMenu(),
    );
  }
}
