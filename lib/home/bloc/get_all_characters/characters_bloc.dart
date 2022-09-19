import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/character.dart';
import '../../controllers/controller_character.dart';

part 'characters_event.dart';
part 'characters_state.dart';

const FAVORITES = "FAVORITES";

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final controller = Controller();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CharactersBloc() : super(CharactersInitial()) {
    on<GetAllCharacters>(getAllCharacters);
    on<UpdateCharacterFavoriteStatus>(addFavoriteCharacter);
  }

  void getAllCharacters(
    GetAllCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoading());
    try {
      List<Character> characters = await controller.getCharacter();
      final SharedPreferences pref = await _prefs;
      final favoriteList = pref.getStringList(FAVORITES) ?? [];
      
      (favoriteList);
      for (var favoriteId in favoriteList) {
        final favIndex = characters
            .indexWhere((element) => int.parse(favoriteId) == element.id);
        if (favIndex != -1) {
          characters[favIndex].isFavorite = true;
        }
      }

      emit(CharactersLoaded(characters: characters));
    } catch (e) {
      emit(CharactersError(error: "Hubo un error cargando los personajes"));
    }
  }

  void addFavoriteCharacter(
    UpdateCharacterFavoriteStatus event,
    Emitter<CharactersState> emit,
  ) async {
    if (state is CharactersLoaded) {
      final updateCharacters = (state as CharactersLoaded).characters;
      final favoriteIndex = updateCharacters.indexWhere(
        (element) => element.id == event.characterId,
      );
      updateCharacters[favoriteIndex].isFavorite =
          !updateCharacters[favoriteIndex].isFavorite;
      emit(CharactersLoaded(characters: updateCharacters));
      final SharedPreferences pref = await _prefs;
      final favoriteList = pref.getStringList(FAVORITES) ?? [];
      final String id = '${updateCharacters[favoriteIndex].id}';
      if (updateCharacters[favoriteIndex].isFavorite) {
        favoriteList.add(id);
      } else {
        favoriteList.removeWhere((element) => element == id);
      }
      await pref.setStringList(FAVORITES, favoriteList);
    }
  }
}
