import '/models/models.dart';
import '/utils/utils.dart';
import 'models/api_exception_model.dart';

class ApiService {
  ApiService({HttpApi? httpClient})
    : _httpClient = httpClient ?? HttpApi(httpApiConfig: httpApiConfig);

  final HttpApi _httpClient;

  Future<Result<dynamic, Exception>> fetchCocktails(String? searchQuery) async {
    try {
      var res = await _httpClient.get('/v1/1/search.php?s=margarita');

      if (res?.statusCode == 200 && res?.body != null) {
        return Success(5);
      }
      final apiExceptionModel = ApiExceptionModel.fromJson(
        res?.body,
        'a/v1/1/search.php?s=',
        "GET",
      );

      return Failure(Exception(apiExceptionModel.toString()));
    } catch (e, s) {
      Logger.log(
        "API Exception: $e",
        tag: "/v1/1/search.php?s=",
        stackTrace: s,
        type: LogType.error,
      );
      return Failure(Exception(e));
    }
  }
}
