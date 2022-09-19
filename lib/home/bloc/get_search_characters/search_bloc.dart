import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/character.dart';
import '../../controllers/controller_filter.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final controllerFilter = ControllerFilter();
  SearchBloc() : super(SearchInitial()) {
    on<SearchCharacters>(search);
  }

  void search(
    SearchCharacters event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      List<Character> characters =
          await controllerFilter.getFilter(event.query);
      emit(SearchFund(characters: characters));
    } catch (e) {
      emit(SearchError(error: "Hubo un error cargando los personajes"));
    }
  }
}
