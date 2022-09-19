part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersError extends CharactersState {
  final String error;

  CharactersError({
    required this.error,
  });
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded({
    required this.characters,
  });
}
