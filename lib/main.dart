import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/constants/pallete.dart';
import 'package:lanceme_ui_project/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
