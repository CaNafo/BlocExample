import 'dart:async';

import 'package:bloc/bloc.dart';

import '/data/data.dart';
import '/utils/utils.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      super(FavoritesState()) {
    _favoritesSubscription = _favoritesRepository.favoritesStream.listen((
      items,
    ) {
      add(const OnFavoritesChanged());
    });
    on<OnRemoveFromFavorites>(_removeFromFavorites);
    on<OnFavoritesChanged>(_onFavoritesChanged);
  }

  final FavoritesRepository _favoritesRepository;
  late final StreamSubscription<List<SearchResult>> _favoritesSubscription;

  void _onFavoritesChanged(
    OnFavoritesChanged event,
    Emitter<FavoritesState> emit,
  ) {
    emit(
      state.copyWith(
        favoritesCount: _favoritesRepository.savedCocktails.length,
      ),
    );
  }

  List<SearchResult> getFavoritesCocktails() {
    return _favoritesRepository.savedCocktails;
  }

  void _removeFromFavorites(
    OnRemoveFromFavorites event,
    Emitter<FavoritesState> emit,
  ) {
    _favoritesRepository.addCocktailToFavorites(event.cocktail);

    Logger.log("Fav count ${_favoritesRepository.savedCocktails.length}");
  }

  @override
  Future<void> close() {
    _favoritesSubscription.cancel();
    return super.close();
  }
}
