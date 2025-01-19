import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  'https://cdn3.pixelcut.app/7/20/uncrop_hero_bdf08a8ca6.jpg'),
            ),
            title: Text('Username'),
            subtitle: Text('place'),
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
              'https://cdn3.pixelcut.app/7/20/uncrop_hero_bdf08a8ca6.jpg',
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
                      '134 likes',
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
                        text: 'username',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: ' Hey this is some description to be replaced',
                      ),
                    ],
                  )),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "view all 69 comments",
                      style: TextStyle(fontSize: 16, color: secondaryColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '19/01/25',
                    style: TextStyle(fontSize: 14, color: secondaryColor),
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
