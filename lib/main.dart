import 'package:flutter/material.dart';
import 'package:portfolio/homePage.dart';
import 'package:portfolio/test.dart';
import 'package:portfolio/test2.dart';
import 'package:portfolio/AnimeStack.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'poppins',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


