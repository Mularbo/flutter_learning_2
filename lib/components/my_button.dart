import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color bColor;
  final VoidCallback onPress;
  MyButton(
      {super.key,
      required this.title,
      this.bColor = const Color(0xffa9b8b8),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bColor,
            ),
            child: Center(
                child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
    );
    ;
  }
}
