import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/models/users.dart';
import 'package:insta_demo/providers/user_provider.dart';
import 'package:insta_demo/resources/firestore_methods.dart';
import 'package:insta_demo/utils/colors.dart';
import 'package:insta_demo/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.snap});
  final snap;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Users user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('comments'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.snap['postId'])
            .collection('comments')
            .orderBy('datePublished', descending: true)// recent comments will show in top ,Is is for sorting the comments according to date
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => CommentCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight, // height of appBar
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(user.photoUrl),
          ),
          subtitle: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Comment as ${user.username}',
              border: InputBorder.none,
            ),
          ),
          // contentPadding: EdgeInsets.only(left: 10),
          trailing: TextButton(
              onPressed: () async {
                await FirestoreMethods().postComment(
                  widget.snap['postId'],
                  user.uid,
                  _commentController.text,
                  user.username,
                  user.photoUrl,
                );
                setState(() {
                  _commentController.text = ""; // when we post the comment after that the comment disappear
                });
              },
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              )),
        ),
      )),
    );
  }
}
