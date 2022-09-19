import 'package:flutter/material.dart';

import '../../models/character.dart';
import 'characters_list.dart';

class CharacterGrindView extends StatelessWidget {
  const CharacterGrindView({Key? key, required this.characters})
      : super(key: key);

  final List<Character> characters;
  @override
  Widget build(BuildContext context) {
    return buildMyCharacters(characters);
  }

  Widget buildMyCharacters(List<Character> characters) {
    return Column(
      children: [
        // Search(),
        Expanded(
          child: GridView.builder(
              itemCount: characters.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                return CharacterList(
                  character: characters[index],
                );
              }),
        ),
      ],
    );
  }
}
