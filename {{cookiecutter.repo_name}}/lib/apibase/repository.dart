import 'package:dio/dio.dart';

import '../flavors/flavor_values.dart';
import '../model/response/user/user.dart';
import 'apiservice.dart';
import 'base_model.dart';
import 'header_intercepter.dart';
import 'server_error.dart';

class Repository {
  static final Repository instance = Repository._initialize();
  late Dio dio;

  late ApiService apiService;

  factory Repository() => instance;

  Repository._initialize() {
    dio = Dio(BaseOptions(baseUrl: FlavorValues.instance.baseUrl));
    dio.interceptors.add(HeaderInterceptor());
    apiService = ApiService(dio);
  }

  Future<BaseModel<User>> getPostFromId(Map<String, dynamic> id) async {
    try {
      final response = await apiService.login(id);
      return BaseModel()..data = response.data;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
  }
}
