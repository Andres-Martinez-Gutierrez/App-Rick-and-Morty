import 'package:flutter/material.dart';
import 'package:pruebatecnica/home/widgets/informatio_row.dart';
import 'package:pruebatecnica/home/widgets/text_character.dart';

import '../../models/character.dart';
import '../../models/episode.dart';
import '../controllers/controller_episode.dart';

class InformationColumn extends StatelessWidget {
  InformationColumn({Key? key, required this.character}) : super(key: key);

  final controllerEpisodes = ControllerEpisodes();
  final Character character;

  final SizedBox spaceHeight5 = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InformationRow(
          character: character,
          text1: 'Tipo',
          text2: character.type != '' ? character.type : 'Desconocido'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextCharacter(text: 'Debut', size: 12, color: Colors.black54),
          getEpisode(character.episodes[0])
        ],
      ),
      InformationRow(
          character: character,
          text1: 'Locación',
          text2: character.location.name),
    ]);
  }

  FutureBuilder<Episode> getEpisode(String url) => FutureBuilder<Episode>(
        future: controllerEpisodes.getEpisode(url),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Column(
            children: [
              TextCharacter(
                  text: (snapshot.data != null ? snapshot.data!.name : ''),
                  size: 18,
                  color: Colors.black),
            ],
          );
        },
      );
}
