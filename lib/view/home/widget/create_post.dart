import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTextPost(),
          SizedBox(height: 20.0),
          _buildMediaPost(),
        ],
      ),
    );
  }

  Widget _buildTextPost() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1699730132083-360f1d7a8f83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1OXx8fGVufDB8fHx8fA%3D%3D'),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Container(
            height: 40.0,
            padding: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextField(
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: 'What\'s on your mind, Aeryn?',
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMediaPost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: Row(
            children: [
              Icon(
                Icons.camera_alt_rounded,
                size: 20.0,
              ),
              SizedBox(width: 8.0),
              Text('Camera'),
            ],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Icon(
                Icons.photo_library_rounded,
                size: 20.0,
              ),
              SizedBox(width: 8.0),
              Text('Gallery'),
            ],
          ),
        )
      ],
    );
  }
}
