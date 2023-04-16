import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alerts {
  static showErrorAlert(
    String errorMessage,
    BuildContext context,
  ) async {
    await Alert(
            context: context,
            type: AlertType.error,
            title: "Error",
            desc: errorMessage ?? "")
        .show();
  }
}
