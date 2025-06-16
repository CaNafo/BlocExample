import 'package:task_open_api/data/data.dart';

sealed class FavoritesEvent {
  const FavoritesEvent();
}

final class OnRemoveFromFavorites extends FavoritesEvent {
  const OnRemoveFromFavorites(this.cocktail);

  final SearchResult cocktail;
}

final class OnFavoritesChanged extends FavoritesEvent {
  const OnFavoritesChanged();
}
