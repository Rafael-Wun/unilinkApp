import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/controllers/auth.dart';
import 'package:unilink_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unilink App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(223, 88, 90, 1.0)),
        useMaterial3: true,
      ),
      home: const UserAuth(),
    );
  }
}
