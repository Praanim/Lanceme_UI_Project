import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:lanceme_ui_project/constants/constants.dart';

class CustomTrailingWidget extends StatelessWidget {
  Widget? showIcon;
  final String name;

  CustomTrailingWidget({
    Key? key,
    this.showIcon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        showIcon ??
            const SizedBox(
              height: 1,
            ),
        const SizedBox(
          width: 2,
        ),
        Text(
          name,
          style: const TextStyle(
              color: Constants.brandSecondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 8,
        ),
        const Icon(
          IconlyLight.arrow_right_2,
          size: 18,
          color: Constants.brandTeritaryColor,
        ),
      ],
    );
  }
}
