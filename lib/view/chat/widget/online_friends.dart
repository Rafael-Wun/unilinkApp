import 'package:flutter/material.dart';

class OnlineFriends extends StatelessWidget {
  const OnlineFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
            _buildOnlineFriend(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnlineFriend() {
    return Container(
      padding: EdgeInsets.fromLTRB(18.0, 16.0, 0, 16.0),
      child: Stack(
        children: [
          Positioned(
            child: Column(children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 24,
              ),
              SizedBox(height: 2.0),
              Text('Username'),
            ]),
          ),
          Positioned(
            bottom: 22,
            right: 12,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 6,
            ),
          ),
        ],
      ),
    );
  }
}
