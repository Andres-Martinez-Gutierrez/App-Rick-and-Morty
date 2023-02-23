part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String error;

  SearchError({
    required this.error,
  });
}

class SearchFund extends SearchState {
  final List<Character> characters;

  SearchFund({
    required this.characters,
  });
}
