import 'package:flutter/material.dart';

import '../../models/character.dart';


class ImageCharacter extends StatelessWidget {
  const ImageCharacter({Key? key, required this.character, required this.height, required this.width}) : super(key: key);

  final Character character;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image.network(
        character.image,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
