import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final String msg;
  const BubbleChat({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 240),
      child: Container(
        margin: EdgeInsets.only(top: 4.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromRGBO(223, 88, 90, 1.0),
        ),
        child: Text(
          msg,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
