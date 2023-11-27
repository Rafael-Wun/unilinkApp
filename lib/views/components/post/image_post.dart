import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/widgets/like_btn.dart';

class ImagePostCard extends StatefulWidget {
  final String postid;
  final String postContent;
  final String postCaption;
  final List<String> likes;
  final String uid;

  const ImagePostCard({
    Key? key,
    required this.postid,
    required this.postContent,
    required this.postCaption,
    required this.likes,
    required this.uid,
  });

  @override
  State<ImagePostCard> createState() => _ImagePostCardState();
}

class _ImagePostCardState extends State<ImagePostCard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  String? userName;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 328,
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
        image: DecorationImage(
          image: NetworkImage(
            widget.postContent,
          ),
          fit: BoxFit.cover,
        ),
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
        padding: EdgeInsets.fromLTRB(6.0, 6.0, 16.0, 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color.fromRGBO(255, 255, 255, .5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
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
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, .2),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Row(
                children: [
                  LikeBtn(
                    isLiked: isLiked,
                    onTap: toogleLike,
                    textColor: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.likes.length.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
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
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.postCaption,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
