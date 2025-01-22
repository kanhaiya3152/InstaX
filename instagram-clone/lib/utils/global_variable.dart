import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/screens/add_post_screen.dart';
import 'package:insta_demo/screens/feed_screen.dart';
import 'package:insta_demo/screens/profile_screen.dart';
import 'package:insta_demo/screens/search_screen.dart';
import 'package:insta_demo/widgets/post_card.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('like'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),
];
