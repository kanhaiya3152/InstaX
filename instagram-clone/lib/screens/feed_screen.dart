import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_demo/utils/colors.dart';
import 'package:insta_demo/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset('assets/ic_instagram.svg',height: 32,color: primaryColor,),
        actions: [
          IconButton(onPressed: (){},
          icon:const Icon(Icons.message_outlined))
        ],
      ),
      body: const PostCard(),
    );
  }
}