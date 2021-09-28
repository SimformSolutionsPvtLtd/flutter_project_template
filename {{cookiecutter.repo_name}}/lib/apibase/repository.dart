import 'package:dio/dio.dart';

import 'header_intercepter.dart';
import '../flavors/flavor_values.dart';
import 'apiservice.dart';
import 'base_model.dart';
import 'server_error.dart';
import '../model/response/user/user.dart';

class Repository {
  Dio dio = Dio();
 late ApiService apiService;

  Repository() {
    dio = Dio();
    dio.interceptors.add(HeaderInterceptor());
    apiService = ApiService(dio: dio, baseUrl: FlavorValues.instance.baseUrl);
  }

  Future<BaseModel> getPostFromId(Map<String, dynamic> id) async {
    User response;
    try {
      response = await apiService.login(id);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}