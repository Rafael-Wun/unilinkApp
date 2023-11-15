import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: <Widget>[
            _buildChat(),
            _buildChat(),
            _buildChat(),
            _buildChat(),
            _buildChat(),
            _buildChat(),
            _buildChat(),
            _buildChat(),
          ],
        ),
      ),
    );
  }

  Widget _buildChat() {
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
          // SizedBox(width: 16.0),
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
          // SizedBox(width: 16.0),
          Text('00:00 AM'),
        ],
      ),
    );
  }
}
