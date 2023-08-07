import 'package:flutter/material.dart';

import '../flavors/flavor.dart';
import '../flavors/flavor_values.dart';

class FlavorConfig extends InheritedWidget {
  const FlavorConfig({
    required this.flavor,
    required this.values,
    required super.child,
    super.key,
  });

  final Flavor flavor;

  final FlavorValues values;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO(username): implement updateShouldNotify
    return false;
  }

  static FlavorConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FlavorConfig>();
}
