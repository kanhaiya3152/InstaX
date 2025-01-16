class Users {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final List followers;
  final List following;

  Users({
    required this.email,
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'username': username,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following,
      };
}
