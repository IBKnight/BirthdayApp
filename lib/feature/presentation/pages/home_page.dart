import 'package:birthday_app/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/feature/presentation/widgets/appbanner.dart';
import 'package:birthday_app/feature/presentation/widgets/entertainments_list.dart';
import 'package:birthday_app/feature/presentation/widgets/menu_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBanner(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 28.w),
                child: Text(
                  Strings.invitationText,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Palette.greenishBlack),
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
                      onPressed: () => context.push('/guest_list'),
                      style: AppTheme.lightTheme.textButtonTheme.style,
                      child: Text(
                        Strings.guestsList,
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
                      onPressed: () => context.push('/wishlist'),
                      style: AppTheme.lightTheme.textButtonTheme.style,
                      child: Text(
                        Strings.wishlist,
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
                Strings.menuTitle,
                style: GoogleFonts.yesevaOne(
                    fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              const MenuGrid(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                Strings.entertainmentTitle,
                style: GoogleFonts.yesevaOne(
                    fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              const EntertainmentsList(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                Strings.locationTitle,
                style: GoogleFonts.yesevaOne(
                    fontSize: 24.sp, color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Placeholder(
                  fallbackHeight: 246.w,
                  child: YandexMap(
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
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
                            scale: MediaQuery.of(context).size.shortestSide *
                                0.0018,
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
                          const CameraPosition(
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
                Strings.address,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Palette.grey,
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
                    text: Strings.navigateToUrl,
                    style: GoogleFonts.jost(
                        decoration: TextDecoration.underline,
                        color: Palette.greenishBlack,
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
