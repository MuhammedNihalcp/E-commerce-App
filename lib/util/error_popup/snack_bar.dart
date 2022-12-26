import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class SnackBarPop {
  static Future<void> popUp(
      BuildContext context, String text, Color color) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: colorWhite),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}