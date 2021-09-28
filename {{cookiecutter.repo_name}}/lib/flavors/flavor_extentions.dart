import 'package:flutter/material.dart';

import 'flavor_config.dart';

extension FlavorExtensions on BuildContext {
  FlavorConfig? get flavorConfig => FlavorConfig.of(this);
}
