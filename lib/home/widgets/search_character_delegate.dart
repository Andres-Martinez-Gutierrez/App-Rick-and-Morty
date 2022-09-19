import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pruebatecnica/models/character.dart';

import '../bloc/get_search_characters/search_bloc.dart';
import '../screens/ui/description_screen.dart';
import 'image_character.dart';

class SearchCharacterDelegate extends SearchDelegate {
  SearchCharacterDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc()
        ..add(
          SearchCharacters(query: query),
        ),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchError) {
            return const ListTile(title: Text('No hay nada con ese término'));
          } else if (state is SearchFund) {
            // crear la lista
            return _showCharacter(state.characters);
          } else if (state is SearchLoading) {
            // Loading
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 4));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text(''),
    );
  }

  Widget _showCharacter(List<Character> characters) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, i) {
        final character = characters[i];
        return ListTile(
          leading:
              ImageCharacter(character: character, height: 180, width: 100),
          title: Text(character.name),
          subtitle: Text(character.status),
          onTap: () {
            // print( pais );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescriptionCharacter(
                  character: character,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
