class FlavorValues {
  factory FlavorValues({required String baseUrl}) {
    _instance ??= FlavorValues._internal(baseUrl);
    return _instance!;
  }

  FlavorValues._internal(this.baseUrl);

  final String baseUrl;

  static FlavorValues? _instance;

  static FlavorValues get instance {
    return _instance!;
  }
}
