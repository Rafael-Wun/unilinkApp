import 'package:flutter/material.dart';

class AboutUser extends StatefulWidget {
  const AboutUser({super.key});

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
            'Cherrisa Aeryn',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 16.0),
          Wrap(
            spacing: 16.0,
            runSpacing: 12.0,
            children: [
              _buildTag(),
              _buildTag(),
              _buildTag(),
            ],
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
