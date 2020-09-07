import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/home_screen.dart';
import 'package:flutter_workshop/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData (
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black
      ),
      home: LoginScreen(),
    );
  }
}