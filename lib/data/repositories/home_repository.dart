import 'dart:async';

import '/data/data.dart';

class HomeRepository {
  const HomeRepository({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;
  Future<List<SearchResult>> fetchCocktails({String? query}) async {
    _apiService.fetchCocktails(query);
    return [SearchResult(title: "TEST Cocktail")];
  }
}
