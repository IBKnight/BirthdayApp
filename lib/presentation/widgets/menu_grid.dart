import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/domain/entities/card_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:birthday_app/presentation/widgets/menu_item.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({Key? key}) : super(key: key);

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  bool _isExpanded = false;
  String _foldText = Strings.collapse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0.h),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 32.w,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: _isExpanded ? 2 : cardList.length,
            itemBuilder: (context, int index) {
              final item = cardList[index];
              return MenuItem(item: item, index: index);
            },
          ),
        ),
        // SizedBox(
        //   height: 12.h,
        // ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              _foldText = (_isExpanded) ? Strings.expand : Strings.collapse;
            });
          },
          child: RichText(
            text: TextSpan(
              text: _foldText,
              style: GoogleFonts.jost(
                  decoration: TextDecoration.underline,
                  color: Palette.greenishBlack,
                  fontSize: 14.sp,
              height: 20.h/14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
