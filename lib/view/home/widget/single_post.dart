import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  final String userId;
  final String userName;
  final String userProfile;
  final String userContent;
  final String userCaption;
  final String postType;

  const SinglePost({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userProfile,
    required this.userContent,
    required this.userCaption,
    required this.postType,
  }) : super(key: key);

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      margin: EdgeInsets.only(bottom: 28.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 328,
              height: 328,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(widget.userContent),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: _buildUserProfile(),
          ),
          Positioned(
            bottom: 56,
            left: 16,
            child: _buildInteractionsBtn(),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            child: _buildCaption(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 4.0, 12.0, 4.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(widget.userProfile),
              ),
            ),
            SizedBox(width: 8.0),
            Text(widget.userName),
            SizedBox(width: 8.0),
            Text('1h'),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionsBtn() {
    return IntrinsicWidth(
      child: Row(
        children: [
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.thumb_up_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 4.0),
                Text(
                  'Likes',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.comment_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 4.0),
                Text(
                  'Comments',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaption() {
    return Container(
      width: 192,
      child: Text(
        widget.userCaption,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
