import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_demo/screens/login_screen.dart';
import 'package:insta_demo/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // duration - 3sec means splashScreen bas 3 sec ke liye visible ho uske baad phir ye login page me navigate ke jaye
    // or pushReplacement direct app se bahar aa jata h wo piche wala page me nhi jata h
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) =>const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,),
            const SizedBox(
              height: 10,
            ),
           Image.asset('assets/instagram.png'),
          ],
        ),
      ),
    );
  }
}
