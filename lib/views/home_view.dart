import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/post/create_post.dart';
import 'package:unilink_project/views/components/post/image_post.dart';
import 'package:unilink_project/views/components/post/text_post.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Hi,'), // Use FirstName
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          children: [
            const CreatePost(),
            Expanded(
              child: _buildPostList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('Posts').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index].data() as Map<String, dynamic>;

              if (post['type'] == "image") {
                return ImagePostCard(
                  postid: post['id'],
                  postContent: post['content'],
                  postCaption: post['caption'],
                  likes: List<String>.from(post['likes']),
                  uid: post['uid'],
                );
              } else if (post['type'] == "text") {
                return TextPostCard(
                  postid: post['id'],
                  postCaption: post['caption'],
                  likes: List<String>.from(post['likes']),
                  uid: post['uid'],
                );
              } else {
                return Container(child: Text('Something went wrong'));
              }
            },
          );
        }
      },
    );
  }
}
