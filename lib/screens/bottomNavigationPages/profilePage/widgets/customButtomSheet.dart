import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/features/auth/screens/loginScreen.dart';

import '../../../../constants/constants.dart';
import '../../../../features/auth/controller/authController.dart';

class CustomBottomSheet extends StatelessWidget {
  final AuthController _authController = AuthController();
  CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Constants.whiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 48,
              decoration: BoxDecoration(
                  color: Constants.brandSecondaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Are Your sure?",
            style: TextStyle(
                color: Constants.brandSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Are you sure you want to Logout from the Workspace? ",
            style: TextStyle(
                color: Constants.brandTeritaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 48),
                  backgroundColor: Constants.errorColor),
              onPressed: () {
                //perform logOut action
                Navigator.of(context).pop();
                _authController.logOut();
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  //cancel the logout action
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: Constants.brandMainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}
