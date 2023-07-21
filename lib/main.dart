import 'package:birthday_app/feature/presentation/widgets/appbanner.dart';
import 'package:birthday_app/feature/presentation/widgets/entertaiments_list.dart';
import 'package:birthday_app/feature/presentation/widgets/menu_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
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

  final String text = 'Приглашаю своих дорогих друзей отметить мой день '
      'рождения в замечательном месте с множеством развлечений,'
      ' вкусных блюд и хорошим настроением!';

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
              AppBanner(),
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
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size(156.w, 50.w),
                        backgroundColor: Color.fromRGBO(253, 172, 7, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
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
                    SizedBox(
                      width: 31.w,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size(156.w, 50.w),
                        backgroundColor: Color.fromRGBO(253, 172, 7, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
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
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Место",
                style:
                    GoogleFonts.yesevaOne(fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.r,
                    ),
                  ),
                  height: 246.w,
                  width: 343.w,
                  child: YandexMap(
                    mapObjects: [
                      PlacemarkMapObject(
                        mapId: const MapObjectId("Контер страйк"),
                        point: const Point(
                          latitude: 47.242613,
                          longitude: 38.691239,
                        ),
                        text: const PlacemarkText(
                            text: "Контра сити", style: PlacemarkTextStyle()),
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            zIndex: 1,
                            image: BitmapDescriptor.fromAssetImage(
                                "assets/route_end.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                    onMapCreated: (YandexMapController controller) {
                      controller.moveCamera(
                        animation: const MapAnimation(
                            type: MapAnimationType.linear, duration: 1),
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: Point(
                              latitude: 47.242613,
                              longitude: 38.691239,
                            ),
                            zoom: 11,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Центральная ул., 84, хутор Седых",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(78, 67, 67, 1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => launchUrl(
                  Uri.parse("https://github.com/IBKnight"),
                ),
                child: RichText(
                  text: TextSpan(
                    text: "Перейти на сайт места",
                    style: GoogleFonts.jost(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
