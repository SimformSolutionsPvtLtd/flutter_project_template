/// Represents the flavors supported for this app
enum Flavor {
  /// A flavor for quality assurance and user acceptance testing
  uat,

  /// A flavor for development of the application
  dev,

  /// A production flavor that will be used to publish this app
  prod;

  bool get isDev => this == Flavor.dev;

  bool get isUat => this == Flavor.uat;

  bool get isProd => this == Flavor.prod;
}
