import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_demo/models/users.dart'
    as model; // bcz of the same name of the class of 'users' in the firebase_auth
import 'package:insta_demo/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.Users> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.Users.fromSnap(snap);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilesPics', file, false);

        // add user to our database

        model.Users user = model.Users(
          email: email,
          uid: cred.user!.uid,
          username: username,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        // await _firestore.collection('users').add({
        //   'usernmae': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'followers': [],
        //   'Following': [],
        // });
        res = 'success';
      } else {
        res = 'Please enter all the fields ';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ); //doesn't want to store it in firebase database that's why cannot using the userCredential
        res = 'success';
      } else {
        res = 'Please enter all the fields ';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
