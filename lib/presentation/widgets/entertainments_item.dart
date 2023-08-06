import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/domain/entities/entertainments_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EntertainmentsItem extends StatelessWidget {
  const EntertainmentsItem({Key? key, required this.item}) : super(key: key);

  final EntertainmentsEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(item.color),
          minRadius: 21.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(41.r),
            child: Image.asset(
              item.image,
              width: 42.w,
              height: 42.w,
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
                item.title,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Palette.greenishBlack,
                    height: 20.h / 14.sp),
              ),
              Text(
                item.subtitle,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Palette.grey,
                    height: 20.h / 14.sp),
              ),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 20.w,
          color: Palette.grey,
        ),
      ],
    );
  }
}
