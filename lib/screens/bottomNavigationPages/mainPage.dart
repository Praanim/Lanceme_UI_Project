import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/emailPage/emailPage.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/homePage/homeScreen.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/notificationPage/notificationPage.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/profilePage/profilePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final screens = const [
    HomePage(),
    Center(
      child: Text("jfaf"),
    ),
    EmailPage(),
    NotificationPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      backgroundColor: Constants.whiteColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: customGreyColor.shade200))),
        child: BottomNavigationBar(
            onTap: (value) => setState(() {
                  _index = value;
                }),
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(IconlyLight.home), //not exactly
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(IconlyLight.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                        badgeColor: Constants.brandMainColor),
                    position: badges.BadgePosition.topEnd(top: -5, end: -6),
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: const Icon(IconlyLight.message)),
                label: 'Email',
              ),
              const BottomNavigationBarItem(
                icon: Icon(IconlyLight.notification),
                label: 'Notfication',
              ),
              const BottomNavigationBarItem(
                icon: Icon(IconlyLight.profile),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
