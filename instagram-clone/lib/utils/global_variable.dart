import 'package:flutter/material.dart';
import 'package:insta_demo/screens/add_post_screen.dart';
import 'package:insta_demo/screens/feed_screen.dart';
import 'package:insta_demo/widgets/post_card.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('like'),
  Text('profile'),
];
