import 'dart:async';

import 'package:task_open_api/utils/logger.dart';

import '/data/data.dart';

class HomeRepository {
  const HomeRepository({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;
  Future<List<SearchResult>> fetchCocktails({String? query}) async {
    var res = await _apiService.fetchCocktails(query);
    Logger.log("RESULT API $res");
    return [SearchResult(title: "TEST Cocktail")];
  }
}
