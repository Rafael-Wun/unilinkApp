import 'package:flutter/material.dart';

class SinglePostCard extends StatefulWidget {
  const SinglePostCard({super.key});

  @override
  State<SinglePostCard> createState() => _SinglePostCardState();
}

class _SinglePostCardState extends State<SinglePostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.circular(16.0)
      ),
      child: Column(
        children: [
         _buildPostHeader(),
          _buildPostContent(),
          _buildPostControls(),
          _buildPostBody()
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1485081669829-bacb8c7bb1f3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fG5hdHVyYWx8ZW58MHx8MHx8fDA%3D'),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text('Anthony'),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.more_vert)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent() {
    return Container(
      child: Image.network('https://images.unsplash.com/photo-1519692933481-e162a57d6721?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cmFpbnxlbnwwfHwwfHx8MA%3D%3D'),
    );
  }

  Widget _buildPostControls() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.favorite_border_outlined,
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.chat_bubble_outline_outlined,
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildPostBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Jadilah seperti hujan yang tak pernah menyalahkan takdir meskipun sudah jatuh berkali-kali.',
        textAlign: TextAlign.start,
      ),
    );
  }
}
