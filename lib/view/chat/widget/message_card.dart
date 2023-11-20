import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 24,
          ),
          Container(
            width: 178,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username'),
                Text('Last Chat'),
              ],
            ),
          ),
          Text('00:00 AM'),
        ],
      ),
    );
  }
}
