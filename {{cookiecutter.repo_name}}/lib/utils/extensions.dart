import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../flavors/flavor.dart';
import '../flavors/flavor_config.dart';

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
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    if (!currentFocus.hasPrimaryFocus) {
      FocusScope.of(this).requestFocus(FocusNode());
    }
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T, TO>(String routeName) =>
      Navigator.of(this).pushReplacementNamed<T, TO>(routeName);

  Future<T?> pushAndRemoveUntil<T>(String routeName) => Navigator.of(this)
      .pushNamedAndRemoveUntil<T>(routeName, (route) => false);

  void pop<T>([T? result]) => Navigator.pop<T>(this, result);

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;

  Size get screenSize => MediaQuery.sizeOf(this);
}

/// provides extension to get a dependency from provider
extension StatefulWidgetExtension on State {
  /// returns object of type [T] from provider
  T provide<T>({bool? listen}) => context.provide<T>(listen: listen);

  /// allows to change field focus from one [FocusNode] to another
  void fieldFocusChange({required FocusNode from, required FocusNode to}) =>
      context.fieldFocusChange(from: from, to: to);

  bool get isDev => FlavorConfig.of(context)?.flavor == Flavor.dev;
}

/// allows to create [MultiProvider] with less boilerplate
extension ProviderExtension<T> on Widget {
  Widget withProviders(List<Provider<T>> providers) => MultiProvider(
        providers: providers,
        child: this,
      );

  Widget withProvider<P>(P provider) => Provider<P>(
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
    return '${this[0].toLowerCase()}${substring(1)}';
  }

  String capitalize() => toBeginningOfSentenceCase(this) ?? '';

  String padding(int width, [String padding = ' ']) =>
      padLeft(width, padding).padRight(width, padding);

  bool get isMail => RegExp(r'^(\w|[.])+@(\w+[.])+\w+$').hasMatch(this);

  void copyToClipboard() => Clipboard.setData(
        ClipboardData(text: this),
      );
}

///Extension on nullable strings
extension NullableStringExtension on String? {
  ///checks if string is null or empty.
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  ///checks if string is not null and not empty.
  bool get isNotNullAndNotEmpty => this != null && (this?.isNotEmpty ?? false);
}
