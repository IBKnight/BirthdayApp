import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  final List<String> _list = [
    Strings.byName,
    Strings.byLastname,
    Strings.byDate,
    Strings.byAge
  ];
  String? _dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Icon(
        Icons.arrow_drop_down,
        size: 30.w,
      ),
      hint: const Text("Сортировать:"),
      value: _dropdownValue,
      style: TextStyle(color: Palette.greenishBlack, fontSize: 14.sp),
      underline: Container(
        height: 1.h,
        color: Palette.greenishBlack,
      ),
      items: _list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(
          () {
            _dropdownValue = value!;
            context.read<GuestListBloc>().add(SortGuest(value!));
          },
        );
      },
    );
  }
}
