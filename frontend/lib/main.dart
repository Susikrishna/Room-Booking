import 'package:flutter/material.dart';
import './login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey, // Set the background color
      ),
    );
  }
}


