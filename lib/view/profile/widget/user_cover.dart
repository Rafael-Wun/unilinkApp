import 'package:flutter/material.dart';

class UserCover extends StatefulWidget {
  const UserCover({super.key});

  @override
  State<UserCover> createState() => _UserCoverState();
}

class _UserCoverState extends State<UserCover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 266.5,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 360.0,
              height: 202.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 360.0,
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('Followers'),
                      Text('999'),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 56,
                  ),
                  Column(
                    children: [
                      Text('Following'),
                      Text('999'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
