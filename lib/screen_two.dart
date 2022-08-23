import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});
  static const String id = 'screen_two';
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: const Icon(CupertinoIcons.profile_circled),
                  title: const Text("Name"),
                  onTap: (() {}),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
