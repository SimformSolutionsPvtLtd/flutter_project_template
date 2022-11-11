import 'package:flutter/material.dart';

import '../flavors/flavor.dart';
import '../flavors/flavor_values.dart';

class FlavorConfig extends InheritedWidget {
  FlavorConfig({
    super.key,
    required this.flavor,
    required this.values,
    Widget? child,
  }) : super(child: child!);
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
