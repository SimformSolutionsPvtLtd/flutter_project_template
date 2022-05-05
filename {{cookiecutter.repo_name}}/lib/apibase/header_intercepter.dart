import 'dart:async';

import 'package:dio/dio.dart';

import '../utils/network_utils.dart';
import '../utils/shared_preferences_helper.dart';
import 'api_logger.dart';

class HeaderInterceptor extends Interceptor {
  final bool showLogs;
  final APILogger _logger = APILogger();

  HeaderInterceptor({this.showLogs = true});

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    final internet = await NetworkUtils().checkIsInternet();
    if (internet) {
      final token = await checkToken();
      if (token.isNotEmpty) {
        options.headers.putIfAbsent('Authorization', () => '$token');
      }
      _logger.printSuccessLog(
        apiMethod: options.method,
        responseBody: options.data.toString(),
        parameters: options.queryParameters,
        url: "${options.baseUrl}${options.path}",
        token: options.headers["Authentication"] ?? "",
      );
    } else {
      ///TODO:- Show no internet dialog or toast here.
    }
    requestInterceptorHandler.next(options);
  }

  @override
  void onResponse(Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    if (response.statusCode == 401) {
      ///TODO:- Handle token expired
    }
    _logger.printSuccessLog(
      apiMethod: response.requestOptions.method,
      responseBody: response.data.toString(),
      parameters: response.requestOptions.data,
      url: "${response.realUri.scheme}://${response.realUri.authority}"
          "${response.realUri.path}",
      token: response.headers.value("Authentication") ?? "",
      isRequest: false,
    );
    responseInterceptorHandler.resolve(response);
  }

  @override
  void onError(
      DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) {
    if (dioError.response != null) {
      _logger.printErrorLog(
        responseBody: dioError.response!.data.toString(),
        parameters: dioError.response!.requestOptions.data,
        url:
            "${dioError.response!.realUri.scheme}://${dioError.response!.realUri.authority}"
            "${dioError.response!.realUri.path}",
        token: dioError.response!.headers.value("Authentication") ?? "",
        errorString: dioError.response!.statusMessage ?? "No message found",
        statusCode: dioError.response!.statusCode ?? -1,
      );
    }

    errorInterceptorHandler.reject(dioError);
  }

  Future<String> checkToken() async =>
      await SharedPreferencesHelper.instance.getAuthToken();
}
