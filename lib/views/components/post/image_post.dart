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

class ImagePostCard extends StatefulWidget {
  final String postID;
  final List<String> likes;
  final String postAuthor;

  const ImagePostCard({
    Key? key,
    required this.postID,
    required this.likes,
    required this.postAuthor,
  });

  @override
  State<ImagePostCard> createState() => _ImagePostCardState();
}

class _ImagePostCardState extends State<ImagePostCard> {
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
        'likes': FieldValue.arrayUnion([currentUser.uid])
      });
    } else {
      postRef.update({
        'likes': FieldValue.arrayRemove([currentUser.uid])
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
        title: Text('Add Comment'),
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
            child: Text("Post"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _commentTextController.clear();
            },
            child: Text("Cancel"),
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
    return FutureBuilder(
      future: getPostData(widget.postID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Post postData = snapshot.data!;
          return Container(
            width: deviceWidth - 32,
            height: deviceWidth - 32,
            margin: EdgeInsets.only(bottom: 24.0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(postData.content!),
                fit: BoxFit.cover,
              ),
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
        } else if (snapshot.hasError) {
          return Center(child: Text('Error${snapshot.error}'));
        }

        return const Center(child: CircularProgressIndicator());
      },
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
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, .35),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      backgroundImage: NetworkImage(authorData.profile),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      authorData.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
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
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 18.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, .35),
            ),
            child: _buildCaption(postData.caption),
          );
        }
      },
    );
  }

  Widget _buildCaption(String caption) {
    return Column(
      children: [
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
                Text(
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
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Text(
                caption,
                style: const TextStyle(
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
