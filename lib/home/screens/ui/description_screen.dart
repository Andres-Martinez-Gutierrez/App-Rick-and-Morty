import 'package:flutter/material.dart';
import 'package:pruebatecnica/home/widgets/image_character.dart';
import 'package:pruebatecnica/home/widgets/information_character.dart';
import 'package:pruebatecnica/models/character.dart';


class DescriptionCharacter extends StatelessWidget {
  final SizedBox spaceWidth5 = const SizedBox(
    width: 5,
  );
  final SizedBox spaceHeight5 = const SizedBox(
    height: 5,
  );
  final Character character;

  const DescriptionCharacter({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Character> characters = [];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: const Alignment(-0.9, -1),
            children: [
              Image.network(
                character.image,
                height: 500,
                width: 500,
                fit: BoxFit.cover,
              ),
              iconBack(context),
              InformationCharacter(
                character: character,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageCharacter(
    List<Character> characters,
  ) {
    return ImageCharacter(
      character: character,
      height: 500,
      width: 500,
    );
  }

  Widget iconBack(BuildContext context){
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'characters_view');
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      iconSize: 30,
    );
  }
}
