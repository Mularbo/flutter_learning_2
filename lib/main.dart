import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Random rValue = Random();

int x = 4;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lottery App!"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Lottery Winning Number is 5",
              style: TextStyle(fontFamily: "Rubik Medium"),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: x == 5
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.done_rounded,
                            color: Colors.green,
                            size: 35,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                              "congrats you won the lottery Your number was $x",
                              textAlign: TextAlign.center),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red.shade400,
                            size: 35,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                              "Better luck next time.Your number is $x.\nTry again",
                              textAlign: TextAlign.center),
                        ],
                      ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = rValue.nextInt(6);
            print(x);
            setState(() {});
          },
          child: Icon(Icons.refresh_rounded),
        ),
      ),
    );
  }
}
