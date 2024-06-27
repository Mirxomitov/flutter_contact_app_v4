import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void replaceSnackBar(BuildContext context, String message) {
    hideSnackBar(context);
    showSnackBar(context, message);
  }

  static void showFlushBar({required BuildContext context, required String message, String? title}) {
    Flushbar(
      backgroundColor: Colors.white,
      title: title,
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
