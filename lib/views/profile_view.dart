import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/profile/edit_profile.dart';
import 'package:unilink_project/views/components/profile/about_user.dart';
import 'package:unilink_project/views/components/profile/user_cover.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: _buildProfileView()),
    );
  }

  Widget _buildProfileView() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final getUserData = snapshot.data!.data() as Map<String, dynamic>;
          return SingleChildScrollView(
            child: Column(
              children: [
                UserCover(
                  profilePicture: getUserData['profile'],
                  followers: List<String>.from(getUserData['followers']),
                  following: List<String>.from(getUserData['following']),
                ),
                SizedBox(height: 24.0),
                AboutUser(
                  userName: getUserData['name'],
                  userBio: getUserData['bio'],
                  userUniv: getUserData['university'],
                ),
                SizedBox(height: 24.0),
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
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error${snapshot.error}'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
