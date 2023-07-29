import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/feature/domain/entities/card_entity.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFBF9),
      appBar: CustomAppBar(
        text: "Канапе",
        leading: Icon(
          Icons.chevron_left,
          size: 24.w,
          color: Palette.lightGrey,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 216.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 166.w,
                        ),
                        Text(
                          "Канапе",
                          style: GoogleFonts.yesevaOne(
                              fontSize: 24.sp, color: Colors.black),
                        ),
                      ],
                    ),
                    Positioned(
                      right: -100.w,
                      top: -49.w,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/kanape.png',
                          width: 357.w,
                          height: 264.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34.w,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: cardList.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Palette.orange,
                            minRadius: 11.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(41.r),
                              child: Image.asset(
                                'assets/ingredient.png',
                                width: 24.w,
                                height: 24.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ингредиент',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.greenishBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4,
                      crossAxisCount: 2,
                      //mainAxisSpacing: 20.h,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}