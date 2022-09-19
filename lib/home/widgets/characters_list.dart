import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/home/bloc/get_all_characters/characters_bloc.dart';

import '../../models/character.dart';
import '../screens/ui/description_screen.dart';
import 'color_status.dart';
import 'image_character.dart';
import 'text_character.dart';

class CharacterList extends StatelessWidget {
  final Character character;
  const CharacterList({
    Key? key,
    required this.character,
  }) : super(key: key);

  final SizedBox space10 = const SizedBox(
    height: 10,
  );
  final SizedBox space5 = const SizedBox(
    width: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: const Alignment(0.9, -0.9), children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionCharacter(
                        character: character,
                      ),
                    ),
                  ),
                  child: ImageCharacter(
                    character: character,
                    height: 180,
                    width: double.infinity,
                  ),
                ),
                favoriteIcon(character.isFavorite, context),
              ]),
              space10,
              TextCharacter(
                text: (character.name),
                size: 16.0,
                color: Colors.black,
              ),
              Row(
                children: [
                  ColorStatus(character: character),
                  space5,
                  TextCharacter(
                    text: character.status=='Alive'? ('Vivo'):character.status=='Dead'?('Muerto'):('Desconosido'),
                    size: 14.0,
                    color: Colors.black54,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget favoriteIcon(bool isFav, BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: IconButton(
        iconSize: 40,
        icon: Icon(
          Icons.favorite,
          color: isFav ? Colors.green : Colors.grey,
        ),
        onPressed: () => context.read<CharactersBloc>().add(
              UpdateCharacterFavoriteStatus(
                characterId: character.id,
              ),
            ),
      ),
    );
  }
}
