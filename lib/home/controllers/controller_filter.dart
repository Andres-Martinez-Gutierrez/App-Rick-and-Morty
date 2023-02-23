import '../../models/character.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../repositories/repository_filter.dart';

class ControllerFilter {
  final apiRepository = ApiRepositoryFilter();

  Future<List<Character>> getFilter(String name) async {
    final Response response = await apiRepository.getFilter(name);
    List<Character> characters = [];

    if (response.statusCode == 200) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => Character.fromJson(character))
          .toList();
    }
    return characters;
  }
}
