import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscured;
  Widget? widget;
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.isObscured,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '*',
      obscureText: isObscured,
      controller: controller,
      cursorColor: Constants.brandMainColor,
      decoration: InputDecoration(
        suffixIcon: widget,
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
