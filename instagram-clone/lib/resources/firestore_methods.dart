import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_demo/models/post.dart';
import 'package:insta_demo/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload Post

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profileImage,
  ) async {
    String res = 'some error occured';

    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postUrl: photoUrl,
        postId: postId,
        datePublished: DateTime.now(),
        profileImage: profileImage,
        likes: [],
      );

      // uploaded to our firestore Database
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
