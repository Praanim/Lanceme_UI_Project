import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/emailPage/widgets/emailMessageCard.dart';

class EmailPage extends StatelessWidget {
  final String _imageUrl =
      'https://imgs.search.brave.com/Ar7V91XTvLn-lJ8TRP1kwQ21Uvm0n2umJwnrY4KyeXc/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC43/b09qdG1mdUNUaEV5/QjN0YVNERFBnSGFF/NyZwaWQ9QXBp';
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: _customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                "All Inbox",
                style: TextStyle(
                    color: Constants.brandTeritaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            EmailMessageCard(
              dateTime: '8:00 AM',
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
              title: 'Welcome to LMU mailer',
              imageUrl: _imageUrl,
            ),
            EmailMessageCard(
              title: 'Unread email & starred',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.',
              dateTime: 'Dec 19',
              isStarred: true,
              isUnread: true,
            ),
            EmailMessageCard(
              title: 'Important Email',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.',
              dateTime: 'Dec 18',
              isImportant: true,
            ),
            EmailMessageCard(
              title: 'Email with Attachment',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.',
              dateTime: '8:00 AM',
              isFileAttached: true,
              fileName: "CoverPreview.jpg",
            ),
            EmailMessageCard(
              title: 'Email with zip Attachment',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.',
              dateTime: '8:00 AM',
              isFileAttached: true,
              fileName: "image_file.zip",
            ),
            EmailMessageCard(
              title: 'Email with zip Attachment',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.',
              dateTime: '8:00 AM',
              isImportant: true,
              isStarred: true,
              isUnread: true,
            )
          ],
        ),
      ),
      floatingActionButton: _customFloatingActionButton(),
    ));
  }

  ElevatedButton _customFloatingActionButton() {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.softGreen,
            fixedSize: const Size(178, 56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          //compose a new maill
        },
        icon: const Icon(
          IconlyLight.edit,
          color: Constants.brandSecondaryColor,
        ),
        label: const Text(
          "Compose New Email",
          style: TextStyle(
              color: Constants.brandSecondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ));
  }

  PreferredSize _customAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: customGreyColor.shade200))),
          child: Row(
            children: [
              const Icon(
                Icons.menu,
                color: Constants.brandSecondaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: TextField(
                cursorColor: Constants.brandMainColor,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    hintText: "Search mails",
                    hintStyle: TextStyle(
                      color: customGreyColor.shade200,
                    )),
              )),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    color: Constants.mainbackgroundColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/pranim.jpg',
                        ),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ));
  }
}
