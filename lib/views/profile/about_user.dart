import 'package:flutter/material.dart';

class AboutUser extends StatefulWidget {
  final String userName;
  final String userBio;
  const AboutUser({
    super.key,
    required this.userName,
    required this.userBio,
  });

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.userName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.userBio,
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: Colors.grey),
      child: Text('Tags'),
    );
  }
}
