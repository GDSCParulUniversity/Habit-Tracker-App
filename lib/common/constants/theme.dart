import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/constants/textstyles.dart';

import 'colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
    ),
    secondaryHeaderColor: AppColors.primaryColor,
    textTheme: lightTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.backgroundLight,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    errorColor: AppColors.primaryColor,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: darkTextTheme(),
  );
}

TextTheme lightTextTheme() {
  /*
    displayLarge, displayMedium, displaySmall 
    headlineMedium, headlineSmall 
    titleLarge, titleMedium, titleSmall 
    bodyLarge, bodyMedium, bodySmall 
    labelLarge, labelSmall
  */
  return TextTheme(
    /*
      thin -> 10
      small -> 12
      normal -> 14
      large -> 16
    */
    titleLarge: MyTextStyle.headingStyle.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleMedium: MyTextStyle.headingStyle.copyWith(
      fontWeight: FontWeight.w600,
    ),
    titleSmall: MyTextStyle.headingStyle.copyWith(
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: MyTextStyle.headingStyle.copyWith(
      fontWeight: FontWeight.w700,
    ),
    bodySmall: MyTextStyle.headingStyle.copyWith(
      fontWeight: FontWeight.w700,
    ),
    labelLarge: MyTextStyle.headingStyle,
    bodyMedium: MyTextStyle.headingStyle,
    displaySmall: MyTextStyle.headingStyle,
  );
}

TextTheme darkTextTheme() {
  return TextTheme(
    bodyText1: MyTextStyle.headingStyle,
  );
}
