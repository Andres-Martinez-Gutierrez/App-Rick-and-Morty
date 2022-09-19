import 'package:flutter/material.dart';
import 'package:pruebatecnica/home/widgets/text_character.dart';

import '../../models/character.dart';

class InformationRow extends StatelessWidget {
  const InformationRow(
      {Key? key,
      required this.character,
      required this.text1,
      required this.text2})
      : super(key: key);

  final Character character;
  final String text1;
  final String text2;

  final SizedBox spaceHeight5 = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCharacter(text: text1, size: 12, color: Colors.black54),
        spaceHeight5,
        TextCharacter(
          text: text2,
          size: 18,
          color: Colors.black,
        ),
      ],
    );
  }
}
