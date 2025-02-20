import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class AppTheme {
  static ThemeData themeApp = ThemeData(
      scaffoldBackgroundColor: AppColor.color0f1414,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColor.colorffffff,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color648286)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color648286)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.color648286)),
        hintStyle:
            TextStyle(color: AppColor.colorffffff, fontWeight: FontWeight.w500),
        labelStyle:
            TextStyle(color: AppColor.colorffffff, fontWeight: FontWeight.w500),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.color648286,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.color648286),
          side: MaterialStateProperty.all(BorderSide.none),
          elevation: MaterialStateProperty.all(0),
        ),
      ));
}
