import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({this.name, this.surname, this.age});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? name;
  final String? surname;
  final int? age;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
