import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class Pallete {
  ThemeData _customLightTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
        primaryColor: Constants.brandMainColor,
        scaffoldBackgroundColor: Constants.mainbackgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Constants.brandMainColor)),
        textTheme: GoogleFonts.urbanistTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Constants.brandMainColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: customGreyColor.shade200))),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: Constants.whiteColor,
            selectedItemColor: Constants.brandMainColor,
            unselectedItemColor: customGreyColor.shade500));
  }

  ThemeData get myLightTheme => _customLightTheme();
}
