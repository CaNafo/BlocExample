import 'package:task_open_api/data/data.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class OnUserSearch extends HomeEvent {
  const OnUserSearch(this.searchQuery);

  final String searchQuery;
}

final class OnAddToFavorites extends HomeEvent{
  const OnAddToFavorites(this.cocktail);

  final SearchResult cocktail;
}
