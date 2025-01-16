import 'package:flutter/material.dart';
import 'package:insta_demo/utils/global_variable.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.mobileScreenLayout,required this.webScreenLayout});

  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return webScreenLayout;
      }
      return mobileScreenLayout;
    });
  }
}