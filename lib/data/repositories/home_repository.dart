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

        //take(5) maps first 5 results as requested in the e-mail
        return Success(
          value.drinks?.take(5)
                  .map((drink) => SearchResult(title: drink.strDrink))
                  .toList() ??
              [],
        );
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
