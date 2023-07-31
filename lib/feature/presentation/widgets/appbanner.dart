import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:birthday_app/feature/domain/entities/appbanner_entity.dart';


class AppBanner extends StatefulWidget {
  const AppBanner({Key? key}) : super(key: key);


  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.w,
      color: Colors.purple,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: appbannerList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    appbannerList[index].image,
                    width: 375.w,
                    height: 250.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 23.w, top: 22.5.h),
                    child: SizedBox(
                      width: 119.w,
                      child: Text(
                        appbannerList[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  appbannerList.length,
                  (index) => _Indicator(
                    isActive: _selectedIndex == index
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 11.h),
      width: isActive ? 30.w : 5.w,
      height: 5.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(39)),
    );
  }
}
