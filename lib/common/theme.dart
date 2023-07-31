import 'package:birthday_app/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 13.5.h, horizontal: 20.w)),
        backgroundColor: const MaterialStatePropertyAll(Palette.orange),
        minimumSize: MaterialStatePropertyAll(Size(156.w, 50.w)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    ),
  );
}
