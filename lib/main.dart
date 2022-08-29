import 'package:flutter/material.dart';
import 'package:tb_course/POSTapis/signup.dart';

import 'getapis/example_five.dart';
// import 'package:tb_course/example_three.dart';
// import 'package:tb_course/example_two.dart';
// import 'package:tb_course/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
