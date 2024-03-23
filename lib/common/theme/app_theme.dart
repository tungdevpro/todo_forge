import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        fontFamily: 'GoogleSans',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: .0,
          backgroundColor: Colors.white,
        ),
      );
  static ThemeData get dark => ThemeData(
        fontFamily: 'GoogleSans',
      );
}