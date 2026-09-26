import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium20Black,
      bodyLarge: AppStyles.bold20Black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14White,
      headlineMedium: AppStyles.medium14White,
      headlineLarge: AppStyles.medium20White,
      bodyLarge: AppStyles.bold20White,
    ),
  );
}
