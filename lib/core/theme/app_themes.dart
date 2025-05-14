import 'package:flutter/material.dart';
import 'package:flutter_navel/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.delaGothicOne().fontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      primaryContainer: AppColors.darkMediumGreenColor
    ),
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 26,color: AppColors.darkPrimaryColor,fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 10,color: AppColors.darkCreamColor,fontWeight: FontWeight.w300,fontFamily: GoogleFonts.raleway().fontFamily)
      )
  );
}