import 'package:streaming_anime/screens/homescreen.dart';
import 'package:streaming_anime/style/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Anime Streaming',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: HomeScreen(),
    );
  }
}