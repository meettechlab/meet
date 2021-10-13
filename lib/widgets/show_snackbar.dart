import 'package:flutter/material.dart';

class ShowSnackbar {
  ShowSnackbar._();
  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text("$message",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF6200EE),
        )),
        behavior: SnackBarBehavior.fixed,
        duration: Duration(seconds: 1),
      ),
    );
  }
}