import 'package:flutter/material.dart';

void showToastMessage(
  BuildContext context, {
  required String msg,
  bool? isError = false,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 2,
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1, // Improved text legibility
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: isError! ? Colors.red : Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
