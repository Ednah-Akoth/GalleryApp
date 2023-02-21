import 'package:flutter/material.dart';
import 'package:week5discussion/screens/home.dart';

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
      title: 'WallpaperHub',
      theme: ThemeData(
        // primaryColor: Colors.white,
        // primarySwatch: Colors.white,
      ),
      home: const Home(),
    );
  }
}
