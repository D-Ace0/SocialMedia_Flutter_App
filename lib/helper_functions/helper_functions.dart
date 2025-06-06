import 'package:flutter/material.dart';

void displayMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(title: Text(message));
    },
  );
}
