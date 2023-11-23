import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  // final String userId;
  final String userName;
  // final String userProfile;
  // final String userContent;
  final String userCaption;
  final String postType;

  const SinglePost({
    Key? key,
    //   required this.userId,
    required this.userName,
    //   required this.userProfile,
    //   required this.userContent,
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
      margin: EdgeInsets.only(bottom: 32.0),
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      decoration: BoxDecoration(
        image: widget.postType == 'image'
            ? DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1700159915592-004562ddcf6f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
                ),
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
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
        padding: EdgeInsets.fromLTRB(6.0, 6.0, 16.0, 6.0),
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
              // backgroundImage: NetworkImage(widget.userProfile),
            ),
            SizedBox(width: 8.0),
            Text(widget.userName),
            SizedBox(width: 8.0),
            Text('1m'),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractions() {
    return Row(
      children: [
        GestureDetector(
          child: Row(
            children: [
              Icon(
                Icons.thumb_up_outlined,
                color: widget.postType == 'image' ? Colors.white : Colors.black,
                size: 20,
              ),
              SizedBox(width: 4.0),
              Text(
                'Likes',
                style: TextStyle(
                  color:
                      widget.postType == 'image' ? Colors.white : Colors.black,
                ),
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
                color: widget.postType == 'image' ? Colors.white : Colors.black,
                size: 20,
              ),
              SizedBox(width: 4.0),
              Text(
                'Comments',
                style: TextStyle(
                  color:
                      widget.postType == 'image' ? Colors.white : Colors.black,
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
              style: TextStyle(fontSize: 20,),
            ),
          ),
        ],
      ),
    );
  }
}
