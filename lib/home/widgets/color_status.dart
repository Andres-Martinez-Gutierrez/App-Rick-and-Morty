import 'package:flutter/material.dart';

import '../../models/character.dart';

class ColorStatus extends StatelessWidget {
  const ColorStatus({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration:  BoxDecoration(
        color: character.status == 'Alive'? Colors.green : character.status == 'Dead' ? Colors.red : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
