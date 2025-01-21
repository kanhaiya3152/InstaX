import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key,required this.snap});
  final snap;

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
          backgroundImage: NetworkImage(
              widget.snap['profilePic']),
        ),
        title: Row(
          children: [
            Text('${widget.snap['name']}',),
            SizedBox(width: 10,),
            Text(DateFormat.yMMMd().format(
              widget.snap['datePublished'].toDate(),
            ),style: TextStyle(fontSize: 12),),
          ],
        ),
        subtitle: Text('${widget.snap['text']}'),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.heart,
              size: 20,
            )),
      ),
    );
  }
}
