import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/post/create_new_post.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();

  Future chooseFile() async {
    final selectedFile = await FilePicker.platform.pickFiles();

    if (selectedFile == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CreateNewPost(userContent: selectedFile.files.first)),
    );
  }

  void postMsg() {
    FirebaseFirestore.instance.collection("User Posts").add({
      'Name': currentUser.email,
      'Content': null,
      'Caption': textController.text.trim(),
      'Timestamp': Timestamp.now(),
      'Type': 'text',
      'Likes': [],
    });

    setState(() {
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          _buildTextPost(),
          SizedBox(height: 20.0),
          _buildMediaPost(),
        ],
      ),
    );
  }

  Widget _buildTextPost() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[400],
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Container(
            height: 40.0,
            padding: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextField(
              controller: textController,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: 'Write Something',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(onPressed: postMsg, icon: Icon(Icons.send_rounded)),
      ],
    );
  }

  Widget _buildMediaPost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: chooseFile,
          child: Row(
            children: [
              Icon(
                Icons.photo_library,
                size: 20.0,
              ),
              SizedBox(width: 8.0),
              Text('Photo'),
            ],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Icon(
                Icons.video_collection,
                size: 20.0,
              ),
              SizedBox(width: 8.0),
              Text('Video'),
            ],
          ),
        )
      ],
    );
  }
}
