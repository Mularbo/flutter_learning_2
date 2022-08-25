import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tb_course/home.dart';
import 'package:tb_course/login_screen.dart';
import 'package:tb_course/student-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString("usertype") ?? "";

    if (isLogin) {
      if (userType == "student") {
        Timer(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => StudentScreen())));
        });
      } else {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => HomeScreen())));
        });
      }
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => LoginScreen())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            "https://images.pexels.com/photos/13046591/pexels-photo-13046591.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),
    );
  }
}
