import 'package:equatable/equatable.dart';

import '/data/data.dart';

final class HomeState extends Equatable {
  HomeState({List<SearchResult>? initSearchResults}) {
    _searchResults = initSearchResults ?? [];
  }

  late final List<SearchResult> _searchResults;
  List<SearchResult> get searchResults => _searchResults;
  void addSearchResult(SearchResult searchResult) {
    _searchResults.add(searchResult);
  }

  HomeState copyWith({List<SearchResult>? initSearchResults}) {
    return HomeState(initSearchResults: initSearchResults ?? _searchResults);
  }

  @override
  List<Object> get props => [searchResults];
}
