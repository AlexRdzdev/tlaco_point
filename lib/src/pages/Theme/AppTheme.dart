import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppColors.dart';

class AppTheme {
  static ThemeData getAppTheme(BuildContext context) {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorLight: AppColors.primaryLightColor,
        primaryColorDark: AppColors.primaryDarkColor,
        backgroundColor: AppColors.white,
        buttonTheme: ButtonThemeData(
            buttonColor: AppColors.primaryLightColor,
            splashColor: AppColors.primaryDarkColor,
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(primary: Colors.white)));
  }
}
