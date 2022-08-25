import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = "", age = "", type = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    age = sp.getString("age") ?? "";
    type = sp.getString("userType") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Screen"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Student Screen"),
            const SizedBox(height: 40),
            Text(type.toString()),
            Text(email.toString()),
            Center(
              child: InkWell(
                onTap: (() async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginScreen())));
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Logout",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
