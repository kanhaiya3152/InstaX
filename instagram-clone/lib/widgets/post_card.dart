import 'package:flutter/material.dart';
import 'package:insta_demo/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: ListTile(
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
                                padding:const EdgeInsets.symmetric(
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
    );
  }
}
