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
  final captionController = TextEditingController();

  Future chooseFile() async {
    final selectedFile = await FilePicker.platform.pickFiles();
    if (selectedFile == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNewPost(
          userContent: selectedFile.files.first,
        ),
      ),
    );
  }

  void postMsg() async {
    try {
      final postRef = await FirebaseFirestore.instance.collection('Posts').add(
        {
          'id': '',
          'content': '',
          'caption': captionController.text.trim(),
          'timestamp': Timestamp.now(),
          'type': 'text',
          'likes': [],
          'uid': currentUser.email,
        },
      );
      final postId = postRef.id;
      await FirebaseFirestore.instance.collection("Posts").doc(postId).update({
        'id': postId,
      });
      setState(() {
        captionController.clear();
      });
    } on FirebaseException catch (e) {
      print("Error during uploadPost: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 0.0, 12.0),
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: _buildCreatePost(),
    );
  }

  Widget _buildCreatePost() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[400],
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Container(
            height: 40.0,
            padding: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextField(
              controller: captionController,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                hintText: 'Write Something',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        GestureDetector(
          onTap: chooseFile,
          child: Row(
            children: [
              Icon(Icons.photo_library),
            ],
          ),
        ),
        IconButton(onPressed: postMsg, icon: Icon(Icons.send_rounded)),
      ],
    );
  }
}
