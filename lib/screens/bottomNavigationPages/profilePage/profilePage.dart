import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/profilePage/widgets/customTrailingWidget.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/profilePage/widgets/profileTile.dart';

import 'widgets/customButtomSheet.dart';

class ProfilePage extends StatelessWidget {
  final String _imageUrl =
      'https://imgs.search.brave.com/Ar7V91XTvLn-lJ8TRP1kwQ21Uvm0n2umJwnrY4KyeXc/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC43/b09qdG1mdUNUaEV5/QjN0YVNERFBnSGFF/NyZwaWQ9QXBp';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        appBar: _customAppBar(),
        body: ListView(
          children: [
            _profileDescription(),
            ProfileTile(
              icon: IconlyLight.add_user,
              title: "Set Status",
              trailing: CustomTrailingWidget(
                name: "Online",
                showIcon: Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.whiteColor, width: 1),
                    shape: BoxShape.circle,
                    color: Constants.brandMainColor,
                  ),
                ),
              ),
            ),
            ProfileTile(
              icon: IconlyLight.profile,
              title: "Account",
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 18,
                color: Constants.brandTeritaryColor,
              ),
            ),
            ProfileTile(
              title: "Activity",
              icon: IconlyLight.time_circle,
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 18,
                color: Constants.brandTeritaryColor,
              ),
            ),
            ProfileTile(
              title: "Connections",
              icon: IconlyLight.user_1,
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 18,
                color: Constants.brandTeritaryColor,
              ),
            ),
            Divider(
              thickness: 1,
              color: customGreyColor.shade200,
            ),

            //app settings section

            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
              child: Text(
                "App Settings",
                style: TextStyle(
                    color: Constants.brandSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ProfileTile(title: "Notification", icon: IconlyLight.notification),
            ProfileTile(
              title: "Appearance",
              icon: Icons.abc,
              trailing: CustomTrailingWidget(name: 'Light'),
            ),
            Divider(
              thickness: 1,
              color: customGreyColor.shade200,
            ),

            //More Section

            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
              child: Text(
                "More",
                style: TextStyle(
                    color: Constants.brandSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ProfileTile(title: "Privacy Policy", icon: IconlyLight.shield_done),
            ProfileTile(title: "Terms & Conditions", icon: IconlyLight.paper),
            ProfileTile(
              title: "Help & Support",
              icon: Icons.question_mark,
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 18,
                color: Constants.brandTeritaryColor,
              ),
            ),
            ProfileTile(
              title: "FAQS",
              icon: Icons.question_mark,
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                size: 18,
                color: Constants.brandTeritaryColor,
              ),
            ),
            Divider(
              thickness: 1,
              color: customGreyColor.shade200,
            ),

            //Account Section

            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
              child: Text(
                "Account",
                style: TextStyle(
                    color: Constants.brandSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextButton.icon(
                    onPressed: () {
                      //showModal Bottom sheet
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const CustomBottomSheet();
                        },
                      );
                    },
                    icon: const Icon(
                      IconlyLight.logout,
                      color: Constants.errorColor,
                    ),
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                          color: Constants.errorColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _profileDescription() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: customGreyColor.shade200))),
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Constants.mainbackgroundColor,
          radius: 48,
          backgroundImage: NetworkImage(_imageUrl),
          child: Transform.translate(
            offset: const Offset(20, 22),
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(color: Constants.whiteColor, width: 1),
                shape: BoxShape.circle,
                color: Constants.brandMainColor,
              ),
            ),
          ),
        ),
        title: const Text(
          "Jane Copper",
          style: TextStyle(
              color: Constants.brandSecondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        subtitle: const Text(
          "janecopper@gmail.com",
          style: TextStyle(
              color: Constants.brandTeritaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  PreferredSize _customAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Text(
            "Profile",
            style: TextStyle(
                color: Constants.brandSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
