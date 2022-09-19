part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchCharacters extends SearchEvent {
  final String query;

  SearchCharacters({required this.query});
}
