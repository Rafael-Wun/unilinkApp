import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unilink_project/models/user_model.dart';

UserModel currentUser = UserModel(
  uid: '',
  email: '',
  profile: '',
  name: '',
  university: '',
  bio: '',
  followers: [],
  following: [],
  post: [],
);

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void showErrorMessage(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(223, 88, 90, 1.0),
          title: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Future<void> signUserUp(
    BuildContext context,
    String email,
    String password,
    String confirmPassword,
    String name,
    String university,
    String bio,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection('Users').doc(userCredential.user!.email).set(
            UserModel(
              uid: userCredential.user!.uid.toString(),
              email: userCredential.user!.email.toString(),
              profile: '',
              name: name,
              university: university,
              bio: bio,
              followers: [],
              following: [],
              post: [],
            ).toMap(),
          );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(context, e.code);
    }
  }

  Future<void> signUserIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      DocumentSnapshot userSnapshot = await _firestore
          .collection('Users')
          .doc(userCredential.user!.email)
          .get();
      currentUser =
          UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
    } on FirebaseAuthException catch (e) {
      showErrorMessage(context, e.code);
    }
  }
}
