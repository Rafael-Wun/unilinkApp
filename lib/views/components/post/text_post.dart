import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/main.dart';
import 'package:unilink_project/models/post.dart';
import 'package:unilink_project/models/user_model.dart';
import 'package:unilink_project/views/components/profile/other_user_profile.dart';
import 'package:unilink_project/views/widgets/comment_btn.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';
import 'package:unilink_project/views/widgets/like_btn.dart';

class TextPostCard extends StatefulWidget {
  final String postID;
  final List<String> likes;
  final String postAuthor;

  const TextPostCard({
    Key? key,
    required this.postID,
    required this.likes,
    required this.postAuthor,
  });

  @override
  State<TextPostCard> createState() => _TextPostCardState();
}

class _TextPostCardState extends State<TextPostCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  final _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.uid);
  }

  void toogleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection('Posts').doc(widget.postID);

    if (isLiked) {
      postRef.update({
        'likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  void addComment(String commentText) {
    FirebaseFirestore.instance
        .collection("Posts")
        .doc(widget.postID)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentBy": currentUser.email,
      "timestamp": Timestamp.now(),
    });
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: CustomTextField(
            controller: _commentTextController,
            hintText: 'Enter a comment',
            keyboardType: TextInputType.text),
        actions: [
          TextButton(
            onPressed: () {
              addComment(_commentTextController.text);
              Navigator.pop(context);
              _commentTextController.clear();
            },
            child: const Text("Post"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _commentTextController.clear();
            },
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  Future<UserModel> getAuthorData(String id) async {
    try {
      DocumentSnapshot authorSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(id).get();
      if (authorSnapshot.exists) {
        return UserModel.fromMap(authorSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('User with UID $id not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data');
    }
  }

  Future<Post> getPostData(String id) async {
    try {
      DocumentSnapshot postSnapshot =
          await FirebaseFirestore.instance.collection('Posts').doc(id).get();
      if (postSnapshot.exists) {
        return Post.fromMap(postSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Post with ID $id not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch post data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth - 32,
      margin: const EdgeInsets.only(bottom: 24.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAuthorProfile(),
          _buildInteractions(),
        ],
      ),
    );
  }

  Widget _buildAuthorProfile() {
    return FutureBuilder<UserModel>(
      future: getAuthorData(widget.postAuthor),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        } else if (snapshot.hasError) {
          return const Text('Error loading author data');
        } else {
          UserModel authorData = snapshot.data!;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OtherUserProfile(userID: authorData.email);
                  },
                ),
              );
            },
            child: IntrinsicWidth(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      backgroundImage: NetworkImage(authorData.profile),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      authorData.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildInteractions() {
    return FutureBuilder(
      future: getPostData(widget.postID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        } else if (snapshot.hasError) {
          return const Text('Error loading author data');
        } else {
          Post postData = snapshot.data!;

          return Container(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        postData.caption,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Row(
                      children: [
                        LikeBtn(
                            isLiked: isLiked,
                            onTap: toogleLike,
                            textColor: Colors.grey),
                        const SizedBox(width: 8.0),
                        Text(
                          widget.likes.length.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        CommentButton(onTap: showCommentDialog),
                        const SizedBox(width: 8.0),
                        const Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
