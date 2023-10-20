import 'package:flutter/material.dart';
import 'package:todoapp/splashScreen.dart';


void main() {
  runApp(MyApp());
}

class Task {
  late final String title;
  late final String description;

  Task(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
