

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


 TextStyle servexMainFont = GoogleFonts.montserrat();
final appTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: AppColors.white,
  ),
  primarySwatch: AppColors.appcolor_material,
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  useMaterial3: true,
  // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  // scaffoldBackgroundColor: AppColors.lightWhiteBg,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      // statusBarColor: AppColors.whiteColor,
    ),
    // iconTheme: IconThemeData(color: Colors.white),

  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  ),
  textButtonTheme: TextButtonThemeData(

    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      textStyle: servexMainFont.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
    ),
  ),

  textTheme: TextTheme(
    /// Regular body text
    bodySmall: servexMainFont.copyWith(
      fontWeight: FontWeight.w400,
    ),
    /// Semi-bold body text
    bodyMedium: servexMainFont.copyWith(
      fontWeight: FontWeight.w600,
    ),
    /// Bold body text
    bodyLarge: servexMainFont.copyWith(
      fontWeight: FontWeight.w700,
    ),

    /// Headline text fonts
    headlineSmall: servexMainFont.copyWith(
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: servexMainFont.copyWith(
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: servexMainFont.copyWith(
      fontWeight: FontWeight.w700,
    ),

    /// Title text fonts and App bar
    titleSmall: servexMainFont.copyWith(
      fontWeight: FontWeight.w400,
    ),
    titleMedium: servexMainFont.copyWith(
      fontWeight: FontWeight.w600,
    ),
    titleLarge: servexMainFont.copyWith(
      fontWeight: FontWeight.w700,
    ),

    /// Button
    labelMedium: servexMainFont.copyWith(
      fontWeight: FontWeight.w600,
    ),

    /// Caption
    displaySmall: servexMainFont.copyWith(
      fontWeight: FontWeight.w400,
    ),

    /// Caption Semi-bold
    displayMedium: servexMainFont.copyWith(
      fontWeight: FontWeight.w600,
    ),
  ),
);
