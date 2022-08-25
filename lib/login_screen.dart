import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tb_course/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                  focusColor: Colors.amber,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "password",
                  prefixIcon: Icon(Icons.password_outlined),
                  suffixIcon: Icon(Icons.visibility)),
            ),
            const SizedBox(height: 20),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  prefixIcon: Icon(Icons.info_outline_rounded),
                )),
            const SizedBox(height: 40),
            Center(
              child: InkWell(
                onTap: (() async {
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.setString("email", emailController.text.toString());
                  sp.setString("age", ageController.text.toString());
                  sp.setBool('isLogin', true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomeScreen())));
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Login",
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
