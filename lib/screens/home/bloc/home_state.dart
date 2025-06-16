import 'package:equatable/equatable.dart';
import 'package:task_open_api/utils/utils.dart';

import '/data/data.dart';

final class HomeState extends Equatable {
  HomeState({List<SearchResult>? initSearchResults, this.favoritesCount = 0, bool? isLoading}) {
    _searchResults = initSearchResults ?? [];
    this.isLoading = isLoading??true;

  }

  final int favoritesCount;
  late final List<SearchResult> _searchResults;
  late final bool isLoading;

  List<SearchResult> get searchResults => _searchResults;

  void addSearchResult(SearchResult searchResult) {
    _searchResults.add(searchResult);
  }

  HomeState copyWith({
    List<SearchResult>? initSearchResults,
    int? favoritesCount,
    bool? isLoading
  }) {
    Logger.log("favoritesCount $favoritesCount");
    return HomeState(
      initSearchResults: initSearchResults ?? _searchResults,
      favoritesCount: favoritesCount ?? this.favoritesCount,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [searchResults, favoritesCount];
}
