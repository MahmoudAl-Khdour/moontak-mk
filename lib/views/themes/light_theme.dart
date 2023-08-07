import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moontak/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: AppColors.kPrimaryColor,
  primaryColor: AppColors.appDefaultColor,
  primaryIconTheme: IconThemeData(
    color: AppColors.appDefaultColor,
  ),
  iconTheme: IconThemeData(color: AppColors.appWhiteColor),
  scaffoldBackgroundColor: AppColors.appWhiteColor,
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: AppColors.appDefaultColor),
    backgroundColor: AppColors.appWhiteColor,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.appDefaultColor,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.appDefaultColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: AppColors.appDefaultColor,
    ),
  ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      color: AppColors.appDefaultColor,
      fontSize: 13,
    ),
    bodyLarge: TextStyle(color: AppColors.appDefaultColor),
    bodyMedium: TextStyle(color: AppColors.appDefaultColor),
    bodySmall: TextStyle(
      color: AppColors.appDefaultColor.withOpacity(0.6),
      fontSize: 16,
    ),
    headlineLarge: TextStyle(
      color: AppColors.appDefaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    headlineMedium: TextStyle(
      color: AppColors.appWhiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headlineSmall: TextStyle(
      color: AppColors.appWhiteColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: AppColors.appDefaultColor.withOpacity(0.4),
      fontWeight: FontWeight.normal,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.appWhiteColor,
    selectedItemColor: AppColors.appDefaultColor,
    unselectedItemColor: Colors.grey,
  ),
);
