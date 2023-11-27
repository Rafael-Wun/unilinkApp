import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/chat/chat_page.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserItemList(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserItemList(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                  receiverUserEmail: data['email'],
                  receiverUserID: data['uid']),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[350],
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                radius: 24,
              ),
              const SizedBox(width: 16.0),
              Text(data['name']),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
