import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      height: 50,
                      width: 50,
                      image: AssetImage("assets/images/logo.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mantenance",
                          style: TextStyle(
                              fontFamily: "Rubik Medium", fontSize: 24),
                        ),
                        Text(
                          "BOX",
                          style: TextStyle(
                              fontFamily: "Rubik Medium",
                              fontSize: 22,
                              color: Color(0xffF9703b)),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Rubik Medium",
                        color: Color(0xff2D3142)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Text(
                    "Login page example",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Rubik Regular",
                        color: Color(0xff4c5980)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: const Color.fromARGB(15, 63, 67, 71),
                      filled: true,
                      prefixIcon:
                          const Icon(Icons.email, color: Color(0xff323f4b)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 77, 81, 85)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: const Color.fromARGB(15, 63, 67, 71),
                      filled: true,
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff323f4b)),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 77, 81, 85)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        fontFamily: "Rubik Medium",
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ]),
                const SizedBox(
                  height: 70,
                ),
                Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: const Color(0xffF9703b),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Rubik Medium",
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Regular",
                          color: Color(0xff4c5980)),
                    ),
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Medium",
                          color: Color(0xffF9703B)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
