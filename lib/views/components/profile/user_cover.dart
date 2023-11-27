import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCover extends StatefulWidget {
  final String profilePicture;
  const UserCover({super.key, required this.profilePicture});

  @override
  State<UserCover> createState() => _UserCoverState();
}

class _UserCoverState extends State<UserCover> {
  late double screenWidth;
  late double screenHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (screenWidth / 16) * 12,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: screenWidth,
              height: (screenWidth / 16) * 9,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                // image: DecorationImage(
                //   image: NetworkImage(
                //     'https://images.unsplash.com/photo-1700367056148-3e49cae7fc78?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8fA%3D%3D',
                //   ),
                //   fit: BoxFit.cover,
                // ),
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
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'N/A',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 56,
                    backgroundImage: NetworkImage(widget.profilePicture),
                  ),
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'N/A',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
