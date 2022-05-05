import 'dart:async';

import 'package:dio/dio.dart';

import '../utils/network_utils.dart';
import '../utils/shared_preferences_helper.dart';

class HeaderInterceptor extends Interceptor {
  final bool showLogs;

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
    } else {
      ///TODO:- Show no internet dialog or toast here.
    }
    requestInterceptorHandler.next(options);
  }

  @override
  void onResponse(Response response,
      ResponseInterceptorHandler responseInterceptorHandler) async {
    if (response.statusCode == 401) {
      ///TODO:- Handle token expired
    }
    responseInterceptorHandler.resolve(response);
  }

  @override
  void onError(
          DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) =>
      errorInterceptorHandler.reject(dioError);

  Future<String> checkToken() async =>
      await SharedPreferencesHelper.instance.getAuthToken();
}
