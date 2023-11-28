import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/models/user_model.dart';
import 'package:unilink_project/views/components/profile/about_user.dart';
import 'package:unilink_project/views/components/profile/other_user_cover.dart';

class OtherUserProfile extends StatefulWidget {
  final String userID;
  const OtherUserProfile({super.key, required this.userID});

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<UserModel> getUserData(String id) async {
    try {
      DocumentSnapshot authorSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(id).get();
      if (authorSnapshot.exists) {
        return UserModel.fromMap(authorSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('User with UID $id not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('About User'),
      ),
      body: SafeArea(child: _buildOtherUserProfile()),
    );
  }

  Widget _buildOtherUserProfile() {
    return FutureBuilder(
      future: getUserData(widget.userID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text('Error loading post data');
        } else {
          UserModel userData = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                OtherUserCover(profilePicture: userData.profile),
                const SizedBox(height: 24.0),
                AboutUser(
                  userName: userData.name,
                  userBio: userData.bio,
                  userUniv: userData.university,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          );
        }
      },
    );
  }
}
