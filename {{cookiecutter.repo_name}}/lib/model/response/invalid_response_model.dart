import 'package:json_annotation/json_annotation.dart';

part 'invalid_response_model.g.dart';

/// Change this model based on project's api error model
@JsonSerializable()
class InvalidResponseModel {
  InvalidResponseModel({
    required this.message,
  });

  factory InvalidResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InvalidResponseModelFromJson(json);

  @JsonKey(name: 'message')
  final String? message;

  Map<String, dynamic> toJson() => _$InvalidResponseModelToJson(this);
}
