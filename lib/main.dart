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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
          title: Center(child: Text("App Bar")),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("testing"),
                  Icon(Icons.done_all_rounded),
                  Text("Testing"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: const Center(child: Text("Container 1")),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: const Center(child: Text("Container 2")),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.teal,
                child: const Center(child: Text("Container 3")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
