import 'package:flutter/material.dart';

import 'flavor.dart';
import 'flavor_values.dart';

class FlavorConfig extends InheritedWidget {
  final Flavor flavor;
  final FlavorValues values;

  FlavorConfig({
    required this.flavor,
    required this.values,
    Widget? child,
  }) : super(child: child!);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static FlavorConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FlavorConfig>();
}
