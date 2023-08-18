import 'package:flutter/material.dart';

import '../values/enumeration.dart';

class SnackBarMessenger {
  const SnackBarMessenger._();

  static final key = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({
    required String message,
    Duration? duration,
  }) =>
      key.currentState
        ?..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            duration: duration ?? Constants.snackBarDuration,
          ),
        );
}