import 'package:flutter/material.dart';
import 'package:unilink_project/view/profile/edit_profile.dart';
import 'package:unilink_project/view/profile/widget/about_user.dart';
import 'package:unilink_project/view/profile/widget/user_cover.dart';
import 'package:unilink_project/view/profile/widget/user_post.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserCover(),
              SizedBox(height: 24.0),
              AboutUser(),
              SizedBox(height: 32.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Container(
                  width: 312,
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(223, 88, 90, 1.0),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              UserPost(),
            ],
          ),
        ),
      ),
    );
  }
}
