import '/models/models.dart';

import '/utils/utils.dart';

class ApiService {
  ApiService({HttpApi? httpClient})
    : _httpClient = httpClient ?? HttpApi(httpApiConfig: httpApiConfig);

  final HttpApi _httpClient;

  Future<Result<dynamic, Exception>> getFollowMeEventById(
    String eventId,
  ) async {
    try {
      var res = await _httpClient.get('/v1/1/search.php?s=margarita');

      if (res?.statusCode == 200 && res?.body != null) {
        return Success(
          FollowMeEventApiModel.fromJson(parseApiResponseBody(res?.body)),
        );
      }
      final apiExceptionModel = ApiExceptionModel.fromJson(
        res?.body,
        'api/FollowMe/GetEvent/$encodedEventId',
        "GET",
      );

      return Failure(Exception(apiExceptionModel.toString()));
    } catch (e, s) {
      Logger.log(
        "API Exception: $e",
        tag: "getFollowMeEvent",
        stackTrace: s,
        type: LogType.error,
      );
      return Failure(Exception(e));
    }
  }
}
