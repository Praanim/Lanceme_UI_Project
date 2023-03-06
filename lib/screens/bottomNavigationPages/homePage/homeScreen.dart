import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/homePage/tabBarPages/projectTools.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int activeIndex = 0;

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.whiteColor,
        title: const CustomAppBar(),
        bottom: TabBar(
            controller: tabController,
            indicatorColor: Constants.brandMainColor,
            isScrollable: true,
            tabs: [
              //not the right way to give bool value but still
              CustomTabBar(
                icon: IconlyLight.work,
                title: "Project Tools",
                isSelected: tabController.index == 0 ? true : false,
              ),
              badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                    badgeColor: Constants.brandMainColor),
                position: badges.BadgePosition.custom(start: 12, top: 4.3),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                child: CustomTabBar(
                  icon: IconlyLight.chat,
                  title: "Chat",
                  isSelected: tabController.index == 1 ? true : false,
                ),
              ),
              CustomTabBar(
                icon: IconlyLight.folder, //mileko chaina
                title: "Drive",
                isSelected: tabController.index == 2 ? true : false,
              ),
              CustomTabBar(
                icon: Icons.timer_sharp, //mileko chaina
                title: "Tracking",
                isSelected: tabController.index == 3 ? true : false,
              ),
            ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            SizedBox(
              height: 16,
            ),
            ProjectDetails(
              template: 'Kanban',
            ),
            ProjectDetails(
              template: 'Scrum',
            ),
            ProjectDetails(
              template: 'Bug Report',
            ),
          ],
        ),
      ),
      backgroundColor: Constants.whiteColor,
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  const CustomTabBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Constants.brandMainColor
                : Constants.brandTeritaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Constants.brandMainColor
                    : Constants.brandTeritaryColor),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/rectangle.png'))),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Lancemeup",
              style: TextStyle(
                  color: Constants.brandSecondaryColor,
                  fontWeight: FontWeight.w600),
            ),
            const Icon(
              IconlyLight.arrow_down_2,
              color: Constants.brandSecondaryColor,
            ),
          ],
        ),
        const Icon(
          IconlyLight.search,
          color: Constants.brandSecondaryColor,
        ),
      ],
    );
  }
}
