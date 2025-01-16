import 'package:insta_demo/responsive/mobile_screen_layout.dart';
import 'package:insta_demo/responsive/res_layout.dart';
import 'package:insta_demo/responsive/web_screen_layout.dart';
import 'package:insta_demo/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:insta_demo/screens/login_screen.dart';
// import 'package:insta_demo/screens/signup_screen.dart';
import 'package:insta_demo/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home:
      home: StreamBuilder(
          stream: FirebaseAuth.instance
              .authStateChanges(), // check the page is login or not
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // use has to be authenticate
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                    webScreenLayout: WebScreenLayout(),
                    mobileScreenLayout: MobileScreenLayout());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }

            return const LoginScreen();
          }),
    );
  }
}
