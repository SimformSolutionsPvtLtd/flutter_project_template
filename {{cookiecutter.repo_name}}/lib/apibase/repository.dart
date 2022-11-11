import 'package:dio/dio.dart';

import '../flavors/flavor_values.dart';
import '../model/response/api_response.dart';
import '../model/response/invalid_response_model.dart';
import '../model/response/user/user.dart';
import '../values/strings.dart';
import 'api_service.dart';
import 'header_interceptor.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();

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

  Future<User> getPostFromId(Map<String, dynamic> id) async {
    return _apiCall<User>(request: () => apiService.login(id));
  }

  Future<T> _apiCall<T>({
    required ApiCallback<T> request,
    String noDataMessage = ApiErrorStrings.somethingWrongErrorMsg,
  }) async {
    try {
      final response = await request();
      if (response.data != null) {
        return response.data as T;
      } else {
        throw Exception(response.message ?? noDataMessage);
      }
    } on String {
      rethrow;
    } on DioError catch (error) {
      if (error.response == null) {
        throw Exception(ApiErrorStrings.noInternetMsg);
      }

      switch (error.response!.statusCode) {
        case 500:
        case 503:
        case 504:
        case 403:
        case 422:
        case 404:
        default:
          final response = InvalidResponseModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
          throw Exception(response.message ?? '');
      }
    }
  }
}

