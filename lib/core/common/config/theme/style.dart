import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  AppStyle._();

  static const String fontName = 'Almarai';

  static final ElevatedButtonThemeData elevatedButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontFamily: fontName)),
  );

  static final OutlinedButtonThemeData outlinedButtonStyle = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontFamily: fontName)),
  );

  static final TextButtonThemeData textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontFamily: fontName)),
  );

  static final inputDecoration = InputDecorationTheme(
      fillColor: AppColors.white,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: AppColors.outlineBlack)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: AppColors.outlineBlack)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: AppColors.primary)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: AppColors.red)),
      labelStyle: TextStyle(fontSize: 14.sp, fontFamily: fontName));

  static final iconTheme = IconThemeData(color: AppColors.primary, size: 24.r);

  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600, color: AppColors.primary, fontFamily: fontName),
    displayMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.primary, fontFamily: fontName),
    displaySmall: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColors.primary, fontFamily: fontName),
    headlineSmall: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColors.textColor, fontFamily: fontName),
    titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textColor, fontFamily: fontName),
    titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColors.textColor, fontFamily: fontName),
    bodyLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.textColor, fontFamily: fontName),
    bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColors.textColor, fontFamily: fontName),
    bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColors.textColor, fontFamily: fontName),
    labelLarge: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.textColor, fontFamily: fontName),
    labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal, color: AppColors.textColor, fontFamily: fontName),
  );
}
