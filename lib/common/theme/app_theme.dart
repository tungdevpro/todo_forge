import 'package:flutter/material.dart';
import 'package:todo_forge/common/constants/app_color.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        fontFamily: 'GoogleSans',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColor.primary,
        appBarTheme: const AppBarTheme(
          elevation: .0,
          backgroundColor: Colors.white,
        ),
      );
  static ThemeData get dark => ThemeData(
        fontFamily: 'GoogleSans',
      );
}