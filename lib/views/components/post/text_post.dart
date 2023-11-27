import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';
import 'package:unilink_project/views/widgets/like_btn.dart';

class TextPostCard extends StatefulWidget {
  final String postid;
  final String postCaption;
  final List<String> likes;
  final String uid;

  const TextPostCard({
    Key? key,
    required this.postid,
    required this.postCaption,
    required this.likes,
    required this.uid,
  });

  @override
  State<TextPostCard> createState() => _TextPostCardState();
}

class _TextPostCardState extends State<TextPostCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  String? userName;

  //comment controller
  final _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.uid);
    loadUserData();
  }

  void loadUserData() async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.uid)
          .get();
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          userName = userData['name'];
        });
      } else {
        print("User document does not exist for uid: ${widget.uid}");
      }
    } catch (e) {
      print("Error loading username: $e");
    }
  }

  void toogleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection('Posts').doc(widget.postid);

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

  // add a comment
  void addComment(String commentText){
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postid)
        .collection("Comments")
        .add({
          "CommentText" : commentText,
          "CommentBy" : currentUser.email,
          "CommentText" : Timestamp.now(),
        });
  }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Comment'),
          content: TextField( //customtextfield
            controller: _commentTextController,
            decoration: InputDecoration(hintText: "Write a comment..."),
          ),
          actions: [
            //SAVE button
            TextButton(
                onPressed: (){
                  addComment(_commentTextController.text);

                    Navigator.pop(context);

                    _commentTextController.clear();
                },
                child: Text("Post"),
            ),
            // cancel button
            TextButton(
                onPressed: (){
                  Navigator.pop(context);

                  _commentTextController.clear();
              },
                child: Text("Cancel"),
            )
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUserProfile(),
          _buildInteractions(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.fromLTRB(6.0, 6.0, 10.0, 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: const Color.fromRGBO(223, 88, 90, 1.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[350],
            ),
            const SizedBox(width: 8.0),
            Text(
              userName ?? 'Loading...',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractions() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 18.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.postCaption,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
                      textColor: Colors.black),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.likes.length.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.comment_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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
}
