import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/router.dart';
import 'package:birthday_app/feature/presentation/pages/app_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'BirthDay App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Palette.lightGrey)
          ),
          textTheme: GoogleFonts.jostTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        // home: DetailScreen(),
      ),
    );
  }
}
