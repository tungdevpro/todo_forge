import 'package:flutter/material.dart';
import 'package:todo_forge/common/constants/app_color.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
      fontFamily: 'Satoshi',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColor.primary,
      appBarTheme: const AppBarTheme(
        elevation: .0,
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColor.primary2,
        filled: true,
        hintStyle: TextStyle(color: AppColor.neutral70, fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: AppColor.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: AppColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: AppColor.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: AppColor.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: AppColor.primary),
        ),
      ));
  static ThemeData get dark => ThemeData(
        fontFamily: 'Satoshi',
      );
}
