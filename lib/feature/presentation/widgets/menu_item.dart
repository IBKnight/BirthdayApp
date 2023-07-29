import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/feature/domain/entities/card_entity.dart';
import 'package:go_router/go_router.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.item, required this.index}) : super(key: key);

  final CardEntity item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details', extra: item),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: (index % 2 == 0)
                ? BorderRadius.only(
              topRight: Radius.circular(25.r),
              bottomLeft: Radius.circular(25.r),
            )
                : BorderRadius.only(
              topLeft: Radius.circular(25.r),
              bottomRight: Radius.circular(25.r),
            ),
            child: Image.asset(
              item.image,
              width: 140.w,
              height: 140.w,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            item.title,
            style: TextStyle(
                color: Palette.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
