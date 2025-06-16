import 'dart:convert';
import 'dart:io';

import '/models/models.dart';

class HttpApiConfig {
  HttpApiConfig({
    required this.baseApiUrl,
    this.encoding,
    this.headers = const {},
    this.timeout = 10,
    this.retryApiCall = true,
    this.waitForTokenRefresh = true,
    this.maxRetryAttempts = 10,
    this.refreshToken,
  });

  final String baseApiUrl;
  final Encoding? encoding;
  Map<String, String> headers;
  final int timeout;
  final bool retryApiCall;
  bool waitForTokenRefresh;
  final int maxRetryAttempts;
  Future<Result<String, Exception>> Function()? refreshToken;

  void addHeaderParameters(Map<String, String> headers) {
    this.headers.addAll(headers);
  }

  void replaceHeaders(Map<String, String> headers) {
    this.headers = headers;
  }

  bool removeAuthorization() {
    return headers.remove(HttpHeaders.authorizationHeader) != null;
  }

  bool removeHeaderParameter(String headerName) {
    return headers.remove(headerName) != null;
  }

  bool authorizationPresent() {
    return headers.containsKey(HttpHeaders.authorizationHeader);
  }

  String? getAuthorizationToken() {
    String? authorizationToken = headers[HttpHeaders.authorizationHeader];
    if (authorizationToken != null) {
      authorizationToken = authorizationToken.replaceFirst("Bearer ", "");
    }
    return headers[HttpHeaders.authorizationHeader];
  }

  HttpApiConfig clone() {
    return HttpApiConfig(
      baseApiUrl: baseApiUrl,
      encoding: encoding,
      headers: {...headers},
      timeout: timeout,
      retryApiCall: retryApiCall,
      maxRetryAttempts: maxRetryAttempts,
      refreshToken: refreshToken,
    );
  }
}
