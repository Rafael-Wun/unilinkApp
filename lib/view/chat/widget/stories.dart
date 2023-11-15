import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _buildStory(),
            _buildStory(),
            _buildStory(),
            _buildStory(),
          ],
        ),
      ),
    );
  }

  Widget _buildStory() {
    return Container(
      width: 88,
      height: 128,
      margin: EdgeInsets.fromLTRB(18.0, 16.0, 0, 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey,
      ),
    );
  }
}
