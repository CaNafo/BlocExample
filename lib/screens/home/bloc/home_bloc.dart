import 'package:bloc/bloc.dart';
import '/data/data.dart';

import '/utils/utils.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(HomeState()) {
    on<OnUserSearch>(_onUserSearch);
  }

  final HomeRepository _homeRepository;

  void _onUserSearch(OnUserSearch event, Emitter<HomeState> emit) {
    Logger.log("Event ${event.searchQuery} emit ${emit.isDone}");
    final updatedList = List.of(state.searchResults)
      ..add(SearchResult(title: "TEST ${state.searchResults.length}"));

    emit(state.copyWith(initSearchResults: updatedList));
  }
}
