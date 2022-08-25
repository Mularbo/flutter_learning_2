import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("name", "asif taj");
                  sp.setInt("age", 25);
                  sp.setBool("isLogin", false);
                  print(sp.getString("name"));
                  print(sp.getInt("age").toString());
                  print(sp.getBool("isLogin"));

                  sp.remove("name");
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "click",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
