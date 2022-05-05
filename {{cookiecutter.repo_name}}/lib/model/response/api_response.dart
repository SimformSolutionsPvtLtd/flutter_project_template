import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse<T> {
  final int? code;

  final T? data;

  final String? message;

  final String? status;

  const APIResponse({
    this.status,
    this.message,
    this.data,
    this.code,
  });

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$APIResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$APIResponseToJson(this, toJsonT);
}
