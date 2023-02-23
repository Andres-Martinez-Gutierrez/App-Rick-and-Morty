part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class GetAllCharacters extends CharactersEvent {}

class UpdateCharacterFavoriteStatus extends CharactersEvent {
  final int characterId;

  UpdateCharacterFavoriteStatus({
    required this.characterId,
  });
}
