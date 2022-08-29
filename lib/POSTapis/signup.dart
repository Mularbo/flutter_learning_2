import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      http.Response response =
          await http.post(Uri.parse("https://reqres.in/api/register"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print("login sucsessfull");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up Api")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "PassWord",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          color: Colors.teal,
                          offset: Offset.fromDirection(-230, 4))
                    ]),
                child: Center(
                  child: Text("login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
