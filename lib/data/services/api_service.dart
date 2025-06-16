import '/utils/utils.dart';

class ApiService {
  ApiService({HttpApi? httpClient})
    : _httpClient = httpClient ?? HttpApi(httpApiConfig: httpApiConfig);

  final HttpApi _httpClient;
}
