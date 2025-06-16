import '/models/models.dart';
import '/utils/utils.dart';
import 'models/api_exception_model.dart';
import 'models/cocktails_list_api_model.dart';

class ApiService {
  ApiService({HttpApi? httpClient})
    : _httpClient = httpClient ?? HttpApi(httpApiConfig: httpApiConfig);

  final HttpApi _httpClient;

  Future<Result<CocktailsListApiModel, Exception>> fetchCocktails(String? searchQuery) async {
    try {
      var res = await _httpClient.get('/v1/1/search.php?s=$searchQuery');

      if (res?.statusCode == 200 && res?.body != null) {
        return Success(
          CocktailsListApiModel.fromJson(parseApiResponseBody(res!.body)),
        );
      }
      final apiExceptionModel = ApiExceptionModel.fromJson(
        res?.body,
        'a/v1/1/search.php?s=$searchQuery',
        "GET",
      );

      return Failure(Exception(apiExceptionModel.toString()));
    } catch (e, s) {
      Logger.log(
        "API Exception: $e",
        tag: "/v1/1/search.php?s=$searchQuery",
        stackTrace: s,
        type: LogType.error,
      );
      return Failure(Exception(e));
    }
  }
}
