import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/notificationPage/widgets/notificationTile.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: customGreyColor.shade200))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 18,
                        color: Constants.brandSecondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.menu,
                    color: Constants.brandSecondaryColor,
                  ),
                ],
              )),
        ),
        body: Column(
          children: [
            //custom tab bar
            SizedBox(
              height: 56,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _makeCustomTab(title: "All", isSelected: true),
                    _makeCustomTab(title: "Invites", isSelected: false),
                    _makeCustomTab(title: "Mentions", isSelected: false),
                    _makeCustomTab(title: "WorkSpace", isSelected: false),
                    _makeCustomTab(title: "Emails", isSelected: false),
                    _makeCustomTab(title: "Something", isSelected: false)
                  ],
                ),
              ),
            ),
            //notifications list
            Expanded(
              child: ListView(
                children: const [
                  NotificationTile(
                      colorTile: Constants.brandMainColor,
                      icon: IconlyLight.download,
                      isNew: true,
                      title:
                          'Jane Copper has downloaded “Wireframing Landing Page”.'),
                  NotificationTile(
                      colorTile: Constants.brandTeritaryColor,
                      icon: Icons.abc,
                      isNew: true,
                      title:
                          'Jane Copper has mentioned you on Lancemeup workspace.'),
                  NotificationTile(
                      colorTile: Constants.info,
                      icon: IconlyLight.time_circle,
                      isNew: false,
                      title:
                          '[REMINDER] Due date of Lancemeup Projects task will be coming'),
                  NotificationTile(
                      colorTile: Constants.errorColor,
                      icon: Icons.remove_circle,
                      isNew: false,
                      title: 'Jane Copper has removed from workspace.'),
                  NotificationTile(
                      colorTile: Constants.warning,
                      icon: IconlyLight.close_square,
                      isNew: false,
                      title:
                          'Jane Copper reject the invitation from workspace.'),
                  NotificationTile(
                      colorTile: Constants.brandMainColor,
                      icon: IconlyLight.tick_square,
                      isNew: false,
                      title:
                          'Jane Copper accept the invitation from workspace.'),
                  NotificationTile(
                      colorTile: Constants.brandMainColor,
                      icon: IconlyLight.tick_square,
                      isNew: false,
                      title:
                          'Jane Copper accept the invitation from workspace.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_makeCustomTab({required String title, required bool isSelected}) {
  return Container(
    height: 24,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
    decoration: BoxDecoration(
        color: isSelected ? Constants.brandMainColor : customGreyColor.shade100,
        borderRadius: BorderRadius.circular(36)),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: isSelected
                ? Constants.whiteColor
                : Constants.brandSecondaryColor,
            fontSize: 12),
      ),
    ),
  );
}
