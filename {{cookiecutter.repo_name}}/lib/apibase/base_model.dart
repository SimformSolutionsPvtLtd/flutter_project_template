import 'server_error.dart';

class BaseModel<T> {
  late ServerError _error;
  late T? data;

  void setException(ServerError error) => _error = error;

  void setData(T? data) => this.data = data;

  ServerError get getException => _error;
}