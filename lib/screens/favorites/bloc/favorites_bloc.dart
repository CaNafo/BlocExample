import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '/data/data.dart';
import '/utils/utils.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      super(FavoritesState()) {
    on<OnRemoveFromFavorites>(_removeFromFavorites);
  }

  final FavoritesRepository _favoritesRepository;

  List<SearchResult> getFavoritesCocktails(){
    return _favoritesRepository.savedCocktails;
  }

  void _removeFromFavorites(
    OnRemoveFromFavorites event,
    Emitter<FavoritesState> emit,
  ) {
    _favoritesRepository.addCocktailToFavorites(event.cocktail);
    emit(
      state.copyWith(
        favoritesCount: _favoritesRepository.savedCocktails.length,
      ),
    );
    Logger.log("Fav count ${_favoritesRepository.savedCocktails.length}");
  }
}
