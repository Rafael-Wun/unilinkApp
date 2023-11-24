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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: OvalBorder(),
        splashColor: Color.fromRGBO(223, 88, 90, 1.0),
      ),
    );
  }

  Widget OnlineFriends() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: SingleChildScrollView(
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

  Widget Stories() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: SingleChildScrollView(
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

  Widget ChatList() {
    return Column(
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
