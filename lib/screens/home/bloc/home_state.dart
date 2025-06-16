import 'package:equatable/equatable.dart';
import 'package:task_open_api/utils/utils.dart';

import '/data/data.dart';

final class HomeState extends Equatable {
  HomeState({List<SearchResult>? initSearchResults, this.favoritesCount = 0}) {
    _searchResults = initSearchResults ?? [];
  }

  final int favoritesCount;
  late final List<SearchResult> _searchResults;

  List<SearchResult> get searchResults => _searchResults;

  void addSearchResult(SearchResult searchResult) {
    _searchResults.add(searchResult);
  }

  HomeState copyWith({
    List<SearchResult>? initSearchResults,
    int? favoritesCount,
  }) {
    Logger.log("favoritesCount $favoritesCount");
    return HomeState(
      initSearchResults: initSearchResults ?? _searchResults,
      favoritesCount: favoritesCount ?? this.favoritesCount,
    );
  }

  @override
  List<Object> get props => [searchResults, favoritesCount];
}
