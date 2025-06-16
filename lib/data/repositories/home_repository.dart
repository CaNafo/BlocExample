import 'dart:async';

import '/data/data.dart';

class HomeRepository {
  Future<List<SearchResult>> fetchCocktails({required String? query}) async {
    return [SearchResult(title: "TEST Cocktail")];
  }
}
