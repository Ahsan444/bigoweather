

import 'package:flutter/material.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';

final appTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: AppColors.white,
  ),
  primarySwatch: AppColors.appcolor_material,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  useMaterial3: true,
);