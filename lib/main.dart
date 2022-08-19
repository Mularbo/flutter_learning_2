import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
          title: Center(child: Text("App Bar")),
        ),
        body: const Center(
          child: Image(
            image: AssetImage("assets/images/MobileLogin.png"),
          ),
        ),
      ),
    );
  }
}
