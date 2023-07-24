import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:birthday_app/feature/presentation/pages/home_page.dart';


class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'BirthDay App',
        theme: ThemeData(
          textTheme: GoogleFonts.jostTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
