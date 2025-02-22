import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class AppTheme {
  static ThemeData themeApp = ThemeData(
      scaffoldBackgroundColor: AppColor.colorffffff,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColor.colorffffff,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 28,
          color: AppColor.color202020,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 21,
          color: AppColor.color202020,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color004CFF)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color004CFF)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color004CFF)),
        hintStyle:
            TextStyle(color: AppColor.colorC7C7C7, fontWeight: FontWeight.w500),
        labelStyle:
            TextStyle(color: AppColor.colorC7C7C7, fontWeight: FontWeight.w500),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.color004CFF,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.color004CFF),
          side: MaterialStateProperty.all(BorderSide.none),
          elevation: MaterialStateProperty.all(0),
        ),
      ));
}
