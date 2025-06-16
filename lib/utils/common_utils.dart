import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class Debounce {
  /// **A utility class to debounce a given action.**
  ///
  /// Example usage:
  /// ```dart
  /// final debouncer = Debounce();
  /// debouncer.debounce(
  ///   debounceTime: 300,
  ///   callbackAction: () {
  ///     // Action to be performed after the debounce time
  ///     log("Debounced action executed");
  ///   },
  /// );
  /// ```
  ///
  Debounce();

  Timer? _debounceTimer;

  /// This method helps in ensuring that a specified action (`callbackAction`) is not
  /// called too frequently, by imposing a delay (`debounceTime`) between successive calls.
  /// If the method is called again before the debounce time elapses, the previous timer is cancelled
  /// and reset.
  ///
  /// This is particularly useful for scenarios like preventing excessive API calls when a user
  /// is typing in a search bar, or controlling the rate of state updates in response to fast-changing inputs.
  ///
  /// Parameters:
  /// - `debounceTime` (int): The time in milliseconds to wait before executing the `callbackAction`.
  ///   Defaults to 200 milliseconds if not specified.
  /// - `callbackAction` (VoidCallback): The action to be executed after the debounce time.
  ///
  /// Notes:
  /// - If this method is called again before the `debounceTime` has elapsed, the previous timer
  ///   is cancelled and a new timer is started with the updated debounce time.
  ///

  Future<void> debounce({
    ///The time in milliseconds to wait before executing the `callbackAction`
    required VoidCallback callbackAction,
    int debounceTime = 200,
  }) async {
    if (_debounceTimer?.isActive == true) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(Duration(milliseconds: debounceTime), () async {
      callbackAction();
    });
  }
}

Map<String, dynamic> parseApiResponseBody(String? body) {
  if (body == null) {
    throw Exception("Api response body is NULL");
  }

  try {
    var decodedJson = jsonDecode(body);

    if (decodedJson is Map<String, dynamic>) {
      return decodedJson;
    }
    throw Exception("Api response body is not a JSON object");
  } catch (e) {
    throw e;
  }
}
