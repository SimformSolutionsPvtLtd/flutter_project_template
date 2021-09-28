import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/response/user/user.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  /// Login
  @POST('/login')
  Future<User> login(
      @Body() Map<String, dynamic> loginRequestBean,
      );
}
