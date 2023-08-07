import 'package:birthday_app/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    this.suffixIcon,
    this.isReadOnly = false,
    this.isNumbered = false,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;
  final Widget? suffixIcon;
  bool isReadOnly;
  bool isNumbered;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.w,
      child: TextFormField(
        cursorColor: Palette.greenishBlack,
        textCapitalization: TextCapitalization.words,
        readOnly: isReadOnly,
        style: TextStyle(fontSize: 16.sp),
        inputFormatters:
            isNumbered ? [FilteringTextInputFormatter.digitsOnly] : [],
        controller: textEditingController,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 16.sp, color: Palette.greenishBlack),
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
