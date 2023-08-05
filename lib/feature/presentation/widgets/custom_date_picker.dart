import 'package:birthday_app/common/palette.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({Key? key, required this.textField}) : super(key: key);

  TextEditingController textField;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? dateTime = await showDatePicker(
          builder: (context, child){
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Palette.darkGreen,
                  onSurface: Palette.greenishBlack,
                ),
              ),
              child: child!,
            );
          },
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(3000));
        if (dateTime != null) {
          setState(() {
            widget.textField.text =
                "${dateTime.year}"
                    "-${(dateTime.month).toString().padLeft(2, '0')}"
                    "-${(dateTime.day).toString().padLeft(2, '0')}";
            selectedDate = dateTime;
          },);
        }
      },
      child: Icon(Icons.calendar_today_outlined, size: 18.w, color: Palette.greenishBlack,),
    );
  }
}
