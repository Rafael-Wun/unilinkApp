import 'package:flutter/material.dart';
import 'package:unilink_project/views/widgets/message_card.dart';
import 'package:unilink_project/views/widgets/online_bubble.dart';
import 'package:unilink_project/views/widgets/story.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(toolbarHeight: 0.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Online',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              onlineFriends(),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Stories',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              stories(),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Chats',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              chatList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        shape: const OvalBorder(),
        splashColor: const Color.fromRGBO(223, 88, 90, 1.0),
      ),
    );
  }

  Widget onlineFriends() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
            OnlineBubble(),
          ],
        ),
      ),
    );
  }

  Widget stories() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
          ],
        ),
      ),
    );
  }

  Widget chatList() {
    return const Column(
      children: <Widget>[
        MessageCard(),
        MessageCard(),
        MessageCard(),
        MessageCard(),
        MessageCard(),
        MessageCard(),
        MessageCard(),
        MessageCard(),
      ],
    );
  }
}
