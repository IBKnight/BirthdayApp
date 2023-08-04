import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:birthday_app/common/palette.dart';

class GuestListItem extends StatelessWidget {
  const GuestListItem({Key? key, required this.item}) : super(key: key);

  final GuestEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          minRadius: 21.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(41.r),
            child: Image.asset(
              'assets/cheese.png',
              width: 64.w,
              height: 64.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${item.name} ${item.surname}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Palette.greenishBlack,
                ),
              ),
              Text(
                '${calculateAge(item.birthday)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
              Text(
                item.profession,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.delete_forever,
          size: 20.w,
          color: Palette.grey,
        ),
      ],
    );
  }

  int calculateAge(DateTime birthDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
