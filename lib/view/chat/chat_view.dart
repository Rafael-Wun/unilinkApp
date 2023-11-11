import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Container(
        color: Color.fromRGBO(223, 88, 90, 1.0),
        child: Center(child: Text('Chat_View')),
      ),
    );
  }
}