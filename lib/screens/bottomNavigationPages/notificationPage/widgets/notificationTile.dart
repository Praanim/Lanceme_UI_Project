import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class NotificationTile extends StatelessWidget {
  final Color colorTile;
  final String title;
  final IconData icon;
  final bool isNew;
  const NotificationTile({
    Key? key,
    required this.colorTile,
    required this.title,
    required this.icon,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Constants.brandTeritaryColor))),
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 16),
        horizontalTitleGap: 0,
        leading: CircleAvatar(
          radius: 48,
          backgroundColor: colorTile,
          child: Icon(
            icon,
            color: Constants.whiteColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
                color: Constants.brandSecondaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        subtitle: const Text(
          '2m ago',
          style: TextStyle(color: Constants.brandTeritaryColor, fontSize: 12),
        ),
        trailing: isNew
            ? Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                    color: Constants.brandMainColor, shape: BoxShape.circle),
              )
            : const SizedBox(
                height: 8,
                width: 8,
              ),
      ),
    );
  }
}
