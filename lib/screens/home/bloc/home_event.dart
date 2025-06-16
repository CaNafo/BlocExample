sealed class HomeEvent {
  const HomeEvent();
}

final class OnUserSearch extends HomeEvent {
  const OnUserSearch(this.searchQuery);

  final String searchQuery;
}
