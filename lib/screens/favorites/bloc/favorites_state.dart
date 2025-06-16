import 'package:equatable/equatable.dart';

import '/data/data.dart';

final class FavoritesState extends Equatable {
  FavoritesState({this.favoritesCount = 0}) {}

  final int favoritesCount;

  FavoritesState copyWith({
    List<SearchResult>? initSearchResults,
    int? favoritesCount,
  }) {
    return FavoritesState(
      favoritesCount: favoritesCount ?? this.favoritesCount,
    );
  }

  @override
  List<Object> get props => [favoritesCount];
}
