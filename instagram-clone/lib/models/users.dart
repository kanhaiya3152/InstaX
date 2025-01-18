import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final List followers;
  final List following;

  Users({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>?;

    if (snapshot == null) {
      throw Exception("Snapshot data is null");
    }

    return Users(
      uid: snapshot['uid'] ?? '',
      username: snapshot['username'] ?? '',
      email: snapshot['email'] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      followers: snapshot['followers'] ?? [],
      following: snapshot['following'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };
}