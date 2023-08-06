import 'package:birthday_app/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, this.leading, this.text, this.action});

  final Widget? leading;
  final String? text;
  final Widget? action;

  @override
  Size get preferredSize => Size(double.infinity, 48.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 7.h),
              blurRadius: 15,
              color: Palette.appBarShadow,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading != null
                ? GestureDetector(child: leading, onTap: () => context.pop())
                : SizedBox(height: 24.w, width: 24.w),
            Text(
              text ?? "",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            action != null
                ? GestureDetector(child: action, onTap: () {})
                : SizedBox(height: 24.w, width: 24.w),
          ],
        ),
      ),
    );
  }
}
