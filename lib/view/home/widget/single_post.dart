import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            child: Image.network(
                'https://images.unsplash.com/photo-1682686580224-cd46ea1a6950?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: _buildUserProfile(),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            child: _buildInteractionsBtn(),
          ),
          Positioned(
            bottom: 16,
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
          color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                'https://images.unsplash.com/photo-1487309078313-fad80c3ec1e5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXNpYW4lMjBtZW58ZW58MHx8MHx8fDA%3D',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.0),
            Text('@an.tony'),
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
    return Text(
      'Caption',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }
}
