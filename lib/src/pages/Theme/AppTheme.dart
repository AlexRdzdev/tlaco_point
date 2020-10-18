import 'package:flutter/material.dart';
import 'package:tlaco_point/resources/AppColors.dart';

class AppTheme {
  static ThemeData getAppTheme(BuildContext context) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorLight: AppColors.primaryLightColor,
        primaryColorDark: AppColors.primaryDarkColor,
        backgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
            if (states.any(interactiveStates.contains)) {
              return TextStyle(color: AppColors.secondaryTextColor);
            }
            return TextStyle(color: AppColors.primaryTextColor);
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(interactiveStates.contains))
                return AppColors.primaryColor;
              return AppColors.primaryLightColor;
            },
          ),
        )));
  }
}
