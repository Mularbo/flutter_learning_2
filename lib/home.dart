import 'package:flutter/material.dart';
import 'package:tb_course/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: (() {
                            userInput = "";
                            answer = "";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "+/-",
                          onPress: (() {
                            userInput += "+/-";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "%",
                          onPress: (() {
                            userInput += "%";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "/",
                          bColor: Colors.orange.shade700,
                          onPress: (() {
                            userInput += "/";
                            setState(() {});
                          }),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: (() {
                            userInput += "7";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "8",
                          onPress: (() {
                            userInput += "8";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "9",
                          onPress: (() {
                            userInput += "9";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "x",
                          bColor: Colors.orange.shade700,
                          onPress: (() {
                            userInput += "x";
                            setState(() {});
                          }),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: (() {
                            userInput += "4";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "5",
                          onPress: (() {
                            userInput += "5";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "6",
                          onPress: (() {
                            userInput += "6";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "-",
                          bColor: Colors.orange.shade700,
                          onPress: (() {
                            userInput += "-";
                            setState(() {});
                          }),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: (() {
                            userInput += "1";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "2",
                          onPress: (() {
                            userInput += "2";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "3",
                          onPress: (() {
                            userInput += "3";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "+",
                          bColor: Colors.orange.shade700,
                          onPress: (() {
                            userInput += "+";
                            setState(() {});
                          }),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: ".",
                          onPress: (() {
                            userInput += ".";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "0",
                          onPress: (() {
                            userInput += "0";
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "DEL",
                          onPress: (() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                        ),
                        MyButton(
                          title: "=",
                          bColor: Colors.orange.shade700,
                          onPress: (() {
                            equalPress();
                            setState(() {});
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
