import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lanceme_ui_project/features/auth/controller/authController.dart';
import 'package:lanceme_ui_project/features/auth/screens/loginScreen.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/mainPage.dart';

//this wrapper is made using stream and any changes to user's authentication
//state will be handled accordingly giving real experience
class Wrapper extends StatelessWidget {
  final _authController = AuthController();
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        initialData: null,
        stream: _authController.authStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: Text("Loading"),
              ),
            );
          }

          return snapshot.data == null ? const LoginIn() : const MainPage();
        });
  }
}
