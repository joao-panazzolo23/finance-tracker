import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static void success(
    BuildContext context, {
    required String message,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.green,
    );
  }

  static void error(BuildContext context, {required String message}) {
    _show(context, message: message, backgroundColor: Colors.red);
  }

  static void information(BuildContext context, {required String message}) {
    _show(context, message: message, backgroundColor: Colors.lightBlueAccent);
  }

  static void warning(BuildContext context, {required String message}) {
    _show(context, message: message, backgroundColor: Colors.yellowAccent);
  }

  static void _show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
