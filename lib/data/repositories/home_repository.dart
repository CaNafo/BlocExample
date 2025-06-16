import 'dart:async';

import '/data/data.dart';
import '/models/models.dart';

class HomeRepository {
  const HomeRepository({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  Future<Result<List<SearchResult>, Exception>> fetchCocktails({
    String? query,
  }) async {
    var res = await _apiService.fetchCocktails(query);
    switch (res) {
      case Success(value: final value):
        return Success(
          value.drinks
                  ?.map((drink) => SearchResult(title: drink.strDrink))
                  .toList() ??
              [],
        );
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
