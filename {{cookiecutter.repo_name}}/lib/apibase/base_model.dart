import 'server_error.dart';

class BaseModel<T> {
  BaseModel({
    this.data,
    this.error,
  });

  ServerError? error;
  T? data;
}
