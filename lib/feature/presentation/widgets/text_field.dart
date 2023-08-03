import 'package:birthday_app/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.labelText,
      this.suffixIcon,})
      : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.w,
      child: TextField(
        style: TextStyle(fontSize: 16.sp),
        controller: textEditingController,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 16.sp,
            color: Palette.greenishBlack
          ),
          filled: true,
          fillColor: Palette.lightGreen,
          labelText: labelText,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
