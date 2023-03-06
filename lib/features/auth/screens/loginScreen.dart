import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lanceme_ui_project/common_widgets/custom_button.dart';
import 'package:lanceme_ui_project/common_widgets/custom_textField.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/features/auth/controller/authController.dart';
import 'package:lanceme_ui_project/screens/bottomNavigationPages/mainPage.dart';

import '../../../common_widgets/customSnackBar.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final AuthController _authController = AuthController();
  final _emailController = TextEditingController(text: 'janecopper@gmail.com');
  final _passwordController = TextEditingController(text: 'randomText');
  bool isObscured = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brandMainColor,
        leading: const Icon(
          Icons.arrow_back,
          color: Constants.whiteColor,
        ),
        title: const Text(
          "SignIn",
          style: TextStyle(
              color: Constants.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                    fontSize: 20,
                    color: Constants.brandSecondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.brandTeritaryColor,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.brandSecondaryColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                controller: _emailController,
                isObscured: false,
                widget: null,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.brandSecondaryColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4,
              ),
              CustomTextField(
                  controller: _passwordController,
                  isObscured: !isObscured,
                  widget: IconButton(
                      onPressed: () {
                        //change obscure value
                        setState(() {
                          isObscured = !isObscured;
                          // print(isObscured);
                        });
                      },
                      icon: Icon(
                        isObscured ? IconlyLight.hide : IconlyLight.show,
                        color: Constants.brandTeritaryColor,
                      ))),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Center(
                          child: Icon(
                        IconlyBold.tick_square,
                        color: Constants.brandMainColor,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                            fontSize: 14,
                            color: Constants.brandSecondaryColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.brandMainColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.3,
              ),
              CustomTextButton(
                  size: size,
                  title: "Login",
                  onPressed: () {
                    //login the user

                    _authController
                        .signInUser(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        )
                        .then((message) => customSnackBar(
                            context, message, Constants.brandMainColor));
                  }),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(136, 150, 171, 1),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      //toggle to signUp view
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.brandMainColor,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
