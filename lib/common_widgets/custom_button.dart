import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.size,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          fixedSize: Size(size.width, 48)),
      child: Text(
        title,
        style: const TextStyle(
            color: Constants.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
