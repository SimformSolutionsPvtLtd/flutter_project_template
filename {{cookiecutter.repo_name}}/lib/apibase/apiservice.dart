import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  /// Login
  @POST('/login')
  Future<APIResponse<User>> login(
    @Body() Map<String, dynamic> loginRequestBean,
  );
}
