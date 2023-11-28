import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExploreFriend extends StatefulWidget {
  final String uid;
  final String? userProfile;
  final String userName;
  final String userBio;

  const ExploreFriend({
    super.key,
    required this.uid,
    required this.userName,
    required this.userProfile,
    required this.userBio,
  });

  @override
  State<ExploreFriend> createState() => _ExploreFriendState();
}

class _ExploreFriendState extends State<ExploreFriend> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isFollowed = false;

  void toogleFollow() {
    setState(() {
      isFollowed = !isFollowed;
    });

    DocumentReference userRef =
        FirebaseFirestore.instance.collection('Users').doc(widget.uid);
    DocumentReference currentUserRef = FirebaseFirestore.instance.collection('Users').doc(currentUser.email);

    if (isFollowed) {
      userRef.update({
        'followers': FieldValue.arrayUnion([currentUser.email])
      });
      currentUserRef.update({
        'following': FieldValue.arrayUnion([widget.uid])
      });
    } else {
      userRef.update({
        'followers': FieldValue.arrayRemove([currentUser.email])
      });
      currentUserRef.update({
        'following': FieldValue.arrayRemove([widget.uid])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 328,
      margin: EdgeInsets.only(bottom: 24.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
        image: DecorationImage(
          image: NetworkImage(
            widget.userProfile ??
                'https://th.bing.com/th/id/OIP.x5dr_hbXDMeN4xLftKIeugHaHa?w=215&h=215&c=7&r=0&o=5&pid=1.7',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .35)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: toogleFollow,
                      child: Text(isFollowed ? 'Followed' : 'Follow'),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.userBio,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
