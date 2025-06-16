import '/data/data.dart';

class FavoritesRepository {
  FavoritesRepository();

  final List<SearchResult> _savedCocktails = [];

  List<SearchResult> get savedCocktails => _savedCocktails;

  void addCocktailToFavorites(SearchResult cocktail) {
    bool cocktailInFavorites = removeCocktailFromFavorites(cocktail);
    if (!cocktailInFavorites) {
      _savedCocktails.add(cocktail);
    }
  }

  bool removeCocktailFromFavorites(SearchResult selectedCocktail) {
    var itemsCount = _savedCocktails.length;
    _savedCocktails.removeWhere((cocktail) => cocktail == selectedCocktail);

    return itemsCount > _savedCocktails.length;
  }

  bool isFavorite(SearchResult selectedCocktail) {
    return _savedCocktails.contains(selectedCocktail);
  }
}
