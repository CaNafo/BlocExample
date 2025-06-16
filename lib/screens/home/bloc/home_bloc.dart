import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '/data/data.dart';
import '/models/models.dart';
import '/utils/utils.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required HomeRepository homeRepository,
    required FavoritesRepository favoritesRepository,
  }) : _homeRepository = homeRepository,
       _favoritesRepository = favoritesRepository,
       super(HomeState()) {
    _favoritesSubscription = _favoritesRepository.favoritesStream.listen((
      items,
    ) {
      add(const OnFavoritesChanged());
    });
    //Handle user search
    on<OnUserSearch>(
      _onUserSearch,
      transformer: debounce(const Duration(milliseconds: 200)),
    );
    //Handle add to favorites press
    on<OnAddToFavorites>(_addToFavorites);
    on<OnFavoritesChanged>(_onFavoritesChanged);
  }

  final HomeRepository _homeRepository;
  final FavoritesRepository _favoritesRepository;
  late final StreamSubscription<List<SearchResult>> _favoritesSubscription;

  EventTransformer<E> debounce<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }

  void _onFavoritesChanged(OnFavoritesChanged event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        favoritesCount: _favoritesRepository.savedCocktails.length,
      ),
    );
  }

  Future<void> _onUserSearch(
    OnUserSearch event,
    Emitter<HomeState> emit,
  ) async {
    var res = await _homeRepository.fetchCocktails(query: event.searchQuery);

    switch (res) {
      case Success(value: final drinks):
        emit(state.copyWith(initSearchResults: drinks));
        break;
      case Failure(exception: final exception):
        emit(state.copyWith(initSearchResults: []));
        Logger.log("Exception fetching drinks $exception");
        break;
    }
  }

  void _addToFavorites(OnAddToFavorites event, Emitter<HomeState> emit) {
    _favoritesRepository.addCocktailToFavorites(event.cocktail);
    emit(
      state.copyWith(
        favoritesCount: _favoritesRepository.savedCocktails.length,
      ),
    );
    Logger.log("Fav count ${_favoritesRepository.savedCocktails.length}");
  }

  bool isCocktailFavorite(SearchResult selectedCocktail) {
    return _favoritesRepository.isFavorite(selectedCocktail);
  }

  @override
  Future<void> close() {
    _favoritesSubscription.cancel();
    return super.close();
  }
}
