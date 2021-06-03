import 'package:covid_trendz/Screens/feed.dart';
import 'package:covid_trendz/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/home.dart';
import 'Screens/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (_, snapshot) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/sign_in': (context) => SignIn(),
          '/home': (context) => HomePage(),
          '/feed': (context) => FeedPage()
        },
      );
    });
  }
}
