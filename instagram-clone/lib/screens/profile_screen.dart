import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/resources/auth_methods.dart';
import 'package:insta_demo/resources/firestore_methods.dart';
import 'package:insta_demo/screens/login_screen.dart';
import 'package:insta_demo/utils/colors.dart';
import 'package:insta_demo/utils/utils.dart';
import 'package:insta_demo/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.uid});
  final String uid;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['Following'].length;
      userData = userSnap.data()!;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Color(0XFFF9F9F9),
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      userData['username'] ?? 'username',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFFF9F9F9)),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.plus_app,
                    color: Color(0XFFF9F9F9),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (ctx) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          shrinkWrap: true,
                          children: [
                            'Sign Out',
                          ]
                              .map(
                                (e) => InkWell(
                                  onTap: () async {
                                    await AuthMethods().signOut();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (ctx) => LoginScreen()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0XFFF9F9F9),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(userData['photoUrl']),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildStateColumn(postLen, 'posts'),
                              buildStateColumn(followers, 'followers'),
                              buildStateColumn(following, 'following'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'username',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 1, left: 10),
                      child: Text(
                        'some description',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FirebaseAuth.instance.currentUser!.uid == widget.uid
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FollowButton(
                                    backgroundColor: mobileBackgroundColor,
                                    borderColor: Colors.grey,
                                    text: 'Edit Profile',
                                    textColor: primaryColor,
                                    function: () {},
                                  ),
                                  FollowButton(
                                    backgroundColor: mobileBackgroundColor,
                                    borderColor: Colors.grey,
                                    text: 'Share Profile',
                                    textColor: primaryColor,
                                    function: () {},
                                  ),
                                ],
                              )
                            : isFollowing
                                ? FollowButton(
                                    backgroundColor: Colors.white,
                                    borderColor: Colors.grey,
                                    text: 'Unfollow',
                                    textColor: Colors.black,
                                    function: () async {
                                      await FirestoreMethods().followUser(
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                          userData['uid']);

                                      setState(() {
                                        isFollowing = false;
                                        followers--;
                                      });
                                    },
                                  )
                                : FollowButton(
                                    backgroundColor: Colors.blue,
                                    borderColor: Colors.grey,
                                    text: 'Follow',
                                    textColor: Colors.white,
                                    function: () async {
                                      await FirestoreMethods().followUser(
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                          userData['uid']);

                                      setState(() {
                                        isFollowing = true;
                                        followers++;
                                      });
                                    },
                                  ),
                      ],
                    ),
                    const Divider(
                      color: mobileBackgroundColor,
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('posts')
                            .where('uid', isEqualTo: widget.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 1.5,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot snap =
                                      snapshot.data!.docs[index];

                                  return Container(
                                    child: Image(
                                      image: NetworkImage(
                                        snap['postUrl'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }),
                          );
                        }),
                  ],
                ),
              ],
            ),
          );
  }

  Column buildStateColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
