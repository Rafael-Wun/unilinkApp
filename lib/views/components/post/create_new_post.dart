import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';

class CreateNewPost extends StatefulWidget {
  final PlatformFile? userContent;

  const CreateNewPost({
    Key? key,
    required this.userContent,
  }) : super(key: key);

  @override
  State<CreateNewPost> createState() => _CreateNewPostState();
}

class _CreateNewPostState extends State<CreateNewPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final captionController = TextEditingController();

  void uploadPost() async {
    try {
      final path = 'files/${widget.userContent!.name}';
      final file = File(widget.userContent!.path!);
      final ref = FirebaseStorage.instance.ref().child(path);

      await ref.putFile(file);
      final contentURL = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection("User Posts").add({
        'Name': currentUser.email,
        'Content': contentURL,
        'Caption': captionController.text.trim(),
        'Timestamp': Timestamp.now(),
        'Type': 'text',
        'Likes': [],
      });

      setState(() {
        captionController.clear();
      });

      Navigator.pop(context);
    } catch (e) {
      print("Error during uploadPost: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Create a new post'),
        actions: [
          IconButton(
            onPressed: uploadPost,
            icon: Icon(Icons.send_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Column(
            children: [
              if (widget.userContent != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image(
                      image: FileImage(File(widget.userContent!.path!)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: captionController,
                hintText: 'Description',
                obsecureText: false,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
