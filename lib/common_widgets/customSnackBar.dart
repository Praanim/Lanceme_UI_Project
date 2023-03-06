import 'package:flutter/material.dart';

void customSnackBar(
    BuildContext context, String content, Color backGroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: backGroundColor,
  ));
}
