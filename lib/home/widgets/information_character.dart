import 'package:flutter/material.dart';


import 'package:pruebatecnica/home/widgets/infomation.dart';
import 'package:pruebatecnica/models/character.dart';
import '../controllers/controller_episode.dart';


class InformationCharacter extends StatelessWidget {
  InformationCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);
  
  final Character character;
  final controllerEpisodes = ControllerEpisodes();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Colors.white,
          shape: BoxShape.rectangle),
      margin: const EdgeInsets.only(
        top: 400,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Information(character: character)
        ),
      ),
    );
  }

}
