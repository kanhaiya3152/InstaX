import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/utils/colors.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key,required this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: Column(
        children: [
          ListTile(
            leading:  CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                snap['profileImage'],
              ),
            ),
            title: Text(snap['username']),
            // subtitle: Text('place'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => Dialog(
                            child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map(
                                (e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        )));
              },
              icon: const Icon(Icons.more_vert),
            ),
          ),
          // Image Section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              snap['postUrl'],
              fit: BoxFit.cover,
            ),
          ),
          // lic=ke,comment section

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border)),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    child: Text(
                      '${snap['likes'].length} likes',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                      text: TextSpan(
                    style: const TextStyle(color: primaryColor),
                    children: [
                      TextSpan(
                        text: snap['username'],
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      
                      TextSpan(
                        text: snap['description'],
                      ),
                    ],
                  )),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child:const Text(
                      "view all 69 comments",
                      style: TextStyle(fontSize: 16, color: secondaryColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                    style:const TextStyle(fontSize: 14, color: secondaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
