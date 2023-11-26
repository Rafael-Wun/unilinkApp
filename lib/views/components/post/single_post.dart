import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/widgets/like_btn.dart';

class SinglePost extends StatefulWidget {
  final String userName;
  final String? userContent;
  final String userCaption;
  final String postId;
  final String postType;
  final List<String> likes;

  const SinglePost({
    Key? key,
    required this.userName,
    this.userContent,
    required this.userCaption,
    required this.postId,
    required this.postType,
    required this.likes,
  }) : super(key: key);

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toogleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      decoration: BoxDecoration(
        image: widget.postType == 'image'
            ? DecorationImage(
                image: NetworkImage(
                    // widget.userContent!,
                    'https://images.unsplash.com/photo-1681008570032-abdfcb23f875?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D'),
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUserProfile(),
          Column(
            children: [
              const SizedBox(height: 24.0),
              if (widget.postType == 'text') _buildTextPost(),
              const SizedBox(height: 24.0),
              _buildInteractions(),
              const SizedBox(height: 8.0),
              if (widget.postType == 'image') _buildCaption(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.fromLTRB(6.0, 6.0, 16.0, 6.0),
        decoration: BoxDecoration(
          color: widget.postType == 'image'
              ? Colors.white
              : Color.fromRGBO(223, 88, 90, .9),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(widget.userName),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractions() {
    return Row(
      children: [
        Row(
          children: [
            LikeBtn(isLiked: isLiked, onTap: toogleLike),
            const SizedBox(width: 8.0),
            Text(
              widget.likes.length.toString(),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          child: Row(
            children: [
              Icon(
                Icons.comment_outlined,
                color: widget.postType == 'image' ? Colors.white : Colors.grey,
                size: 20,
              ),
              SizedBox(width: 4.0),
              Text(
                'Comments',
                style: TextStyle(
                  color:
                      widget.postType == 'image' ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaption() {
    return Row(
      children: [
        Text(
          widget.userCaption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  _buildTextPost() {
    return Container(
      width: 296,
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.userCaption,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
