import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/config/theme/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    textTheme: AppStyle.textTheme,
    fontFamily: AppStyle.fontName,
    elevatedButtonTheme: AppStyle.elevatedButtonStyle,
    outlinedButtonTheme: AppStyle.outlinedButtonStyle,
    textButtonTheme: AppStyle.textButtonStyle,
    inputDecorationTheme: AppStyle.inputDecoration,
    iconTheme: AppStyle.iconTheme,
    
  );
}
