import '/utils/utils.dart';

class ApiExceptionModel implements Exception {
  factory ApiExceptionModel.fromJson(
    String? body,
    String apiPath,
    String method,
  ) {
    Map<String, dynamic>? json;

    try {
      json = parseApiResponseBody(body);
    } catch (e) {
      Logger.log(
        "$e",
        type: LogType.error,
      );
    }

    return ApiExceptionModel(
      status: json?['status'] as int?,
      type: json?['type'] as String?,
      title: json?['title'] as String?,
      detail: json?['detail'] as String?,
      instance: json?['instance'] as String?,
      errors: json?['errors'] as Map<String, dynamic>?,
      apiPath: apiPath,
      method: method,
    );
  }
  const ApiExceptionModel({
    required this.apiPath,
    required this.method,
    this.status,
    this.type,
    this.title,
    this.detail,
    this.instance,
    this.errors,
  });

  final int? status;
  final String? type;
  final String? title;
  final String? detail;
  final String? instance;
  final String apiPath;
  final String method;
  final Map<String, dynamic>? errors;

  @override
  String toString() {
    Logger.logApi(
      type: ApiLogType.error,
      apiPath: apiPath,
      method: method,
      statusCode: status,
      responseBody: toJson().toString(),
    );
    return detail ?? 'An error occurred.';
  }

  Map<String, dynamic> toJson() {
    return Map.from({
      "type": type,
      "title": title,
      "status": status,
      "detail": detail,
      "instance": instance,
      "errors": errors,
    });
  }
}
