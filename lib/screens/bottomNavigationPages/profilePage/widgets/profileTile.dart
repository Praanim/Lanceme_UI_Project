import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/constants/constants.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  Widget? trailing;

  ProfileTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 0,
        leading: Icon(
          icon,
          color: Constants.brandTeritaryColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Constants.brandSecondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        trailing: trailing);
  }
}
