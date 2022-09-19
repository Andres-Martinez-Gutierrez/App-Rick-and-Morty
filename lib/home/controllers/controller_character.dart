import 'dart:convert';
import 'package:http/http.dart';
import 'package:pruebatecnica/home/repositories/repository_character.dart';
import 'package:pruebatecnica/models/character.dart';

class Controller {
  final apiRepository = ApiRepository();

  Future<List<Character>> getCharacter() async {
    final Response response = await apiRepository.getCharacters();
    List<Character> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => Character.fromJson(character))
          .toList();
    }
    return characters;
  }
}

