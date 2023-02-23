import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/home/widgets/text_character.dart';

import '../../models/character.dart';
import '../bloc/get_all_characters/characters_bloc.dart';
import 'information_column.dart';
import 'information_principal.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.character}) : super(key: key);

  final Character character;
  final SizedBox spaceHeight5 = const SizedBox(
    height: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCharacter(
          text: character.name,
          size: 30,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        InformationPrincipal(character: character),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Datos personajes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        spaceHeight5,
        InformationColumn(character: character),
        const SizedBox(
          height: 31,
        ),
        addFavoriteChar(context),
      ],
    );
  }

  Widget addFavoriteChar(BuildContext ctx) {
    return OutlinedButton.icon(
      onPressed: () {
        ctx.read<CharactersBloc>().add(
              UpdateCharacterFavoriteStatus(
                characterId: character.id,
              ),
            );
        Navigator.pop(ctx);
      },
      icon: const Icon(
        Icons.favorite_border,
        color: Colors.lightGreen,
      ),
      label: const Text(
        'Añadir a favoritos',
        style: TextStyle(color: Colors.lightGreen, fontSize: 15),
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(color: Colors.lightGreen, width: 3)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(15),
        ),
        minimumSize: MaterialStateProperty.all(const Size(350, 40)),
      ),
    );
  }
}
