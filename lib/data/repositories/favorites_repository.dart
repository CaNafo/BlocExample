import '/data/data.dart';

class FavoritesRepository {
  FavoritesRepository();

  final List<SearchResult> _savedCocktails = [];

  List<SearchResult> get savedCocktails => _savedCocktails;

  void addCocktailToFavorites(SearchResult cocktail) {
    _savedCocktails.add(cocktail);
  }

  void removeCocktailFromFavorites(SearchResult selectedCocktail) {
    _savedCocktails.removeWhere(
      (cocktail) => cocktail == selectedCocktail,
    );
  }
}
