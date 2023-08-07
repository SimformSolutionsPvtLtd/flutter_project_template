import 'package:flutter/foundation.dart';

import '../utils/extensions.dart';

// ignore_for_file: avoid_print
class APILogger {
  static const int _defaultPadding = 3;

  void printSuccessLog({
    required String responseBody,
    required Object parameters,
    required String url,
    required String token,
    required String apiMethod,
    bool isRequest = true,
    int spacerLines = _defaultPadding,
  }) {
    final apiType = isRequest ? 'REQUEST' : 'RESPONSE';
    final log = 'flutter: --------------------------------------------\n'
        '            $apiType\n'
        '-----------------------------------------------------\n'
        ' Method :$apiMethod\n'
        '-----------------------------------------------------\n'
        'Request URL   - $url\n'
        ':: Parameters - $parameters\n'
        ':: UTC Time   - ${DateTime.now().toUtc()}\n'
        '-----------------------------------------------------\n'
        'flutter: :: Authentication Token: $token\n'
        'flutter: --------------------------------------------\n'
        'Body : $responseBody\n';

    debugPrint(log.padding(spacerLines, '\n'));
  }

  void printErrorLog({
    required String responseBody,
    required Object parameters,
    required String url,
    required String token,
    required String errorString,
    required int statusCode,
    int spacerLines = _defaultPadding,
  }) {
    final log = 'flutter: --------------------------------------------\n'
        '            REQUEST\n'
        '-----------------------------------------------------\n'
        'Request URL   - $url\n'
        ':: Parameters - $parameters\n'
        ':: UTC Time   - ${DateTime.now().toUtc()}\n'
        '-----------------------------------------------------\n'
        'flutter: :: Authentication Token: $token\n'
        'flutter: --------------------------------------------\n'
        'flutter: --------------------------------------------\n'
        '            ERROR\n'
        '-----------------------------------------------------\n'
        'Status Code: $statusCode\n'
        'Message: $errorString\n'
        '-----------------------------------------------------\n'
        'Body : $responseBody\n';

    debugPrint(log.padding(spacerLines, '\n'));
  }
}
