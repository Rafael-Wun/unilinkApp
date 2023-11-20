import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 128,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey,
      ),
    );
  }
}
