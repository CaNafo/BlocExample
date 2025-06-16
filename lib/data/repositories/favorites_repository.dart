import 'dart:async';

import '/data/data.dart';

class FavoritesRepository {
  FavoritesRepository();

  final StreamController<List<SearchResult>> _favoritesController =
      StreamController.broadcast();
  Stream<List<SearchResult>> get favoritesStream => _favoritesController.stream;

  final List<SearchResult> _savedCocktails = [];

  List<SearchResult> get savedCocktails => _savedCocktails;

  void addCocktailToFavorites(SearchResult cocktail) {
    bool cocktailInFavorites = removeCocktailFromFavorites(cocktail);
    if (!cocktailInFavorites) {
      _savedCocktails.add(cocktail);
    }
    _favoritesController.add(_savedCocktails);
  }

  bool removeCocktailFromFavorites(SearchResult selectedCocktail) {
    var itemsCount = _savedCocktails.length;
    _savedCocktails.removeWhere((cocktail) => cocktail == selectedCocktail);
    _favoritesController.add(_savedCocktails);

    return itemsCount > _savedCocktails.length;
  }

  bool isFavorite(SearchResult selectedCocktail) {
    return _savedCocktails.contains(selectedCocktail);
  }
}
