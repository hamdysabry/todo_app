import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared-components/theme/color.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightGreenColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      centerTitle: false,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 36),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(color: lightGrayColor, size: 36),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
