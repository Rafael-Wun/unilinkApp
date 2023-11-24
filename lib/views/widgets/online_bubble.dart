import 'package:flutter/material.dart';

class OnlineBubble extends StatefulWidget {
  const OnlineBubble({super.key});

  @override
  State<OnlineBubble> createState() => _OnlineBubbleState();
}

class _OnlineBubbleState extends State<OnlineBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          Positioned(
            child: Column(children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 24,
              ),
              SizedBox(height: 2.0),
              Text('Username'),
            ]),
          ),
          Positioned(
            bottom: 22,
            right: 12,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 6,
            ),
          ),
        ],
      ),
    );
  }
}