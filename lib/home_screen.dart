import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_course/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer!"),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              accountName: Text("data"),
              accountEmail: Text("some@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/logo.png",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.profile_circled),
              title: const Text("Profile"),
              onTap: (() {
                Navigator.pushNamed(context, ScreenTwo.id);
              }),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenTwo.id);
                  },
                  child: Text("Screen 1")))
        ],
      ),
    );
  }
}
