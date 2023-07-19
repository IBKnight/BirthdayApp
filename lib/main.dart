import 'package:birthday_app/feature/presentation/widgets/entertaiments_list.dart';
import 'package:birthday_app/feature/presentation/widgets/menu_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.jostTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});


  final String text =
      'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250.h,
                color: Colors.purple,
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 28.w),
                child: Text(
                  text,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 156.w,
                      height: 50.h,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(253, 172, 7, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        child: Text(
                          "Список гостей",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 31.w,
                    ),
                    SizedBox(
                      width: 156.w,
                      height: 50.h,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(253, 172, 7, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        child: Text(
                          "Вишлист",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Меню",
                style:
                    GoogleFonts.yesevaOne(fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              MenuGrid(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Развлечения",
                style:
                    GoogleFonts.yesevaOne(fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              EntertaimentsList(),
              SizedBox(height: 30.h,),
              Text(
                "Место",
                style:
                GoogleFonts.yesevaOne(fontSize: 24.sp, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
