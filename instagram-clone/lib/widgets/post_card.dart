import 'package:flutter/material.dart';
import 'package:insta_demo/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      child: ListTile(
        leading: CircleAvatar(
          radius: ,
          backgroundImage: NetworkImage('https://cdn3.pixelcut.app/7/20/uncrop_hero_bdf08a8ca6.jpg'),
        ),
      ),
    );
  }
}