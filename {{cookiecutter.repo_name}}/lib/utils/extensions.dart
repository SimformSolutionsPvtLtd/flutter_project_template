import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../app_config.dart';
import '../flavors/flavor.dart';
import '../flavors/flavor_config.dart';

/// provides extension to use dynamic sizes
// ignore_for_file: type_annotate_public_apis
extension SdpExtenstion on num {
  /// provides display density based sizes
  double get sdp => (this * 0.75 + devicePixelRatio).toDouble();
}

/// provides extension to get a dependency from provider
extension ContextExtension on BuildContext {
  /// returns object of type [T] from provider
  T provide<T>({bool? listen}) => Provider.of<T>(this, listen: listen ?? false);

  /// allows to change field focus from one [FocusNode] to another
  void fieldFocusChange({required FocusNode from, required FocusNode to}) {
    from.unfocus();
    FocusScope.of(this).requestFocus(to);
  }

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (!currentFocus.hasPrimaryFocus) {
      FocusScope.of(this).requestFocus(FocusNode());
    }
  }

  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  void pushReplacementNamed(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  void pushAndRemoveUntil(String routeName) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);

  void pop() => Navigator.pop(this);
}

/// provides extension to get a dependency from provider
extension StatefulWidgetExtension on State {
  /// returns object of type [T] from provider
  T provide<T>() => Provider.of<T>(context, listen: false);

  /// allows to change field focus from one [FocusNode] to another
  void fieldFocusChange({required FocusNode from, required FocusNode to}) {
    from.unfocus();
    FocusScope.of(context).requestFocus(to);
  }

  bool get isDev => FlavorConfig.of(context)!.flavor == Flavor.dev;
}

/// allows to create [MultiProvider] with less boilerplate
extension ProviderExtension<T> on Widget {
  Widget withProviders(List<Provider> providers) => MultiProvider(
        providers: providers,
        child: this,
      );

  Widget withProvider<T>(T provider) => Provider<T>(
        create: (_) => provider,
        child: this,
      );
}

/// DateTime extension
extension DateUtils on DateTime {
  String dateToStringWithFormat({String format = 'y-M-d'}) {
    return DateFormat(format).format(this);
  }

  static DateTime stringToDateWithFormat({
    required String format,
    required String dateString,
  }) {
    return DateFormat(format).parse(dateString);
  }
}

extension StringExtension on String {
  String lowerCaseFirstLatter() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }

  String capitalize() => toBeginningOfSentenceCase(this) ?? "";

  String padding(int width, [String padding = " "]) =>
      padLeft(width, padding).padRight(width, padding);

  bool get isMail => RegExp(r"^(\w|[.])+@(\w+[.])+\w+$").hasMatch(this);

  void copyToClipboard() => Clipboard.setData(
        ClipboardData(text: this),
      );
}
