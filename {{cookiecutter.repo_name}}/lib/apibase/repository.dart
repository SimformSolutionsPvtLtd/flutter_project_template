import 'package:dio/dio.dart';

import '../flavors/flavor_values.dart';
import '../model/response/user/user.dart';
import 'apiservice.dart';
import 'base_model.dart';
import 'header_intercepter.dart';
import 'server_error.dart';

class Repository {
  factory Repository() => instance;

  Repository._initialize() {
    dio = Dio(BaseOptions(baseUrl: FlavorValues.instance.baseUrl));
    dio.interceptors.add(HeaderInterceptor());
    apiService = ApiService(dio);
  }

  static final Repository instance = Repository._initialize();

  late Dio dio;

  late ApiService apiService;

  Future<BaseModel<User>> getPostFromId(Map<String, dynamic> id) async {
    try {
      final response = await apiService.login(id);
      return BaseModel(data: response.data);
    } on DioError catch (error) {
      return BaseModel(error: ServerError.withError(error: error));
    }
  }
}
