import 'package:flutter/material.dart';

class FlavorValues {
  final String baseUrl;

  static FlavorValues _instance;

  factory FlavorValues({
    @required String baseUrl}) {
    _instance ??= FlavorValues._internal(baseUrl);
    return _instance;
  }

  FlavorValues._internal(this.baseUrl);

  static FlavorValues get instance { return _instance;}

}