import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Badge(
                    child: Icon(Icons.shopping_cart_checkout),
                    badgeContent: const Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    animationDuration: Duration(seconds: 1),
                    animationType: BadgeAnimationType.fade,
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(end: -15, top: -15),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    enableActiveFill: true,
                    keyboardAppearance: Brightness.light,
                    pinTheme: PinTheme(
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.grey.shade200,
                        inactiveColor: Colors.black,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'Fade First',
                          textStyle: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        ScaleAnimatedText(
                          'Then Scale',
                          textStyle: TextStyle(
                              fontSize: 70.0, fontFamily: 'Canterbury'),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
