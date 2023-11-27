import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text;
  final String time;
  final String userName;
  const Comment({super.key,
    required this.text,
    required this.time,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userName, style: TextStyle(color: Colors.grey),),
              Text(" . ", style: TextStyle(color: Colors.grey),),
              Text(time, style: TextStyle(color: Colors.grey),),
            ],
          ),
        ],
      ),
    );
  }
}
