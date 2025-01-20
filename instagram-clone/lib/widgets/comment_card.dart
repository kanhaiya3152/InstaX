import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage('https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg'),
        ),
        title: Text('username'),
        subtitle: Text('Nice pic bro!'),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(CupertinoIcons.heart,size: 20,)
          ),
      ),
    );
  }
}         