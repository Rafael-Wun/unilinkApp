import 'package:flutter/material.dart';
import 'package:unilink_project/view/chat/widget/chat_list.dart';
import 'package:unilink_project/view/chat/widget/online_friends.dart';
import 'package:unilink_project/view/chat/widget/stories.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Online',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                OnlineFriends(),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Stories',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Stories(),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Chats',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ChatList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
