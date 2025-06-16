import 'package:bloc/bloc.dart';
import 'package:task_open_api/data/repositories/models/models.dart';

import '/utils/utils.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<OnUserSearch>(_onUserSearch);
  }

  void _onUserSearch(OnUserSearch event, Emitter<HomeState> emit) {
    Logger.log("Event ${event.searchQuery} emit ${emit.isDone}");
    final updatedList = List.of(state.searchResults)
      ..add(SearchResult(title: "TEST ${state.searchResults.length}"));

    emit(state.copyWith(initSearchResults: updatedList));
  }
}
