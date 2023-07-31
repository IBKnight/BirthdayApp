import 'package:birthday_app/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.labelText,
      this.suffixIcon,
      this.onPressed})
      : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;
  final Widget? suffixIcon;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.h,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.lightGreen,
          labelText: labelText,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: () => onPressed,
                  child: suffixIcon,
                )
              : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
