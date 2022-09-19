import 'package:flutter/material.dart';

class TextCharacter extends StatelessWidget {

  final String text;
  final double size;
  final Color color;

  const TextCharacter({Key? key, required this.text, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            color: color, fontSize: size, fontWeight: FontWeight.bold)
    );
  }
}
