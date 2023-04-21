import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertsDialog {
  static showAlertDialog(
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
