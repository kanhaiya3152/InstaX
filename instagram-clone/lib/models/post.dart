import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profileImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postUrl,
    required this.postId,
    required this.datePublished,
    required this.profileImage,
    required this.likes,
  });

  // It is seen in the Firestore Database where all data stores
  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'username': username,
        'postId' : postId,
        'datePublished' : datePublished,
        'postUrl': postUrl,
        'profileImage': profileImage,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'] ?? '',
      description: snapshot['description'] ?? '',
      uid: snapshot['uid'] ?? '',
      postUrl: snapshot['postUrl'] ?? '',
      profileImage: snapshot['profileImage'] ?? '',
      likes: snapshot['likes'] ,
      datePublished: snapshot['datePublished'] ,
      postId: snapshot['postId'] ?? '',
    );
  }
}
