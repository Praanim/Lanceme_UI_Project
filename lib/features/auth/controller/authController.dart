import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/common_widgets/customSnackBar.dart';
import 'package:lanceme_ui_project/features/auth/repository/authRepository.dart';

import '../../../constants/constants.dart';

class AuthController {
  final AuthRepository _repository = AuthRepository();

  Future<String> signInUser(String email, String password) async {
    final message = await _repository.signIn(email, password);
    return message;
  }

  Stream<User?> get authStateChange => _repository.authStateChange;

  void logOut() {
    _repository.logOut();
  }
}
