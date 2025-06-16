import 'dart:io';

import '../utils.dart';

///This file contains all REST API configuration

const String baseUrl = 'https://www.thecocktaildb.com/api/json';

final _httpBaseConfig = HttpApiConfig(
  baseApiUrl: baseUrl,
  maxRetryAttempts: 2,
  headers: {HttpHeaders.contentTypeHeader: 'application/json'},
);

HttpApiConfig httpApiConfig = _httpBaseConfig.clone();

HttpApiConfig get baseHttpApiConfig => _httpBaseConfig.clone();
