import 'package:flutter/material.dart';
import 'package:pruebatecnica/home/widgets/text_character.dart';

import '../../models/character.dart';
import 'color_status.dart';

class InformationPrincipal extends StatelessWidget {
  const InformationPrincipal({Key? key, required this.character}) : super(key: key);

  final Character character;
  final SizedBox spaceHeight5 = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const TextCharacter(text: 'Estado', size: 12, color: Colors.black54),
            spaceHeight5,
            Row(
              children: [
                ColorStatus(character: character),
                const SizedBox(width: 5,),
                Text(character.status, style: const TextStyle(fontSize: 18))
              ],
            ),
          ],
        ),
        Column(
          children: [
            const TextCharacter(text: 'Especie', size: 12, color: Colors.black54),
            spaceHeight5,
            Text(character.species, style: const TextStyle(fontSize: 18))
          ],
        ),
        Column(
          children: [
            const TextCharacter(text: 'Genero', size: 12, color: Colors.black54),
            spaceHeight5,
            Text(character.gender, style: const TextStyle(fontSize: 18))
          ],
        ),
      ],
    );
  }
}