import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/get_all_characters/characters_bloc.dart';
import '../../widgets/character_grid_view.dart';
import '../../widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final Text title = const Text.rich(
    TextSpan(
      children: [
        TextSpan(text: 'Personajes ', style: TextStyle(color: Colors.black87)),
        TextSpan(
            text: 'Rick and Morty',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    ),
    textAlign: TextAlign.start,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        elevation: 0,
        backgroundColor: Colors.white24,
        actions: const [
          Search(),
        ],
      ),
      body: charactersWidget(),
    );
  }

  Widget charactersWidget() => BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            return CharacterGrindView(
              characters: state.characters,
            );
          } else if (state is CharactersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharactersError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox.shrink();
        },
      );
}
