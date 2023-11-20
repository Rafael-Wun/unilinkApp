import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({super.key});

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
            // child: Image.network(
            //     'https://images.unsplash.com/photo-1537000492618-6838fca45244?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZSUyMDElM0ExfGVufDB8fDB8fHwy'),
            child: Container(
              width: 328,
              height: 328,
              color: Colors.grey,
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
              ),
            ),
            SizedBox(width: 8.0),
            Text('[username]'),
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
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
