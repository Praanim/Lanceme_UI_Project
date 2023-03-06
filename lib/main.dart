import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/constants/pallete.dart';
import 'package:lanceme_ui_project/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanceme UI Project',
      debugShowCheckedModeBanner: false,
      theme: Pallete().myLightTheme,
      home: const SplashScreen(),
    );
  }
}
