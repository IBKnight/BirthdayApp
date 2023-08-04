import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:birthday_app/common/palette.dart';

class GuestListItem extends StatelessWidget {
  GuestListItem({
    Key? key,
    required this.item,
    required this.nameController,
    required this.lastnameController,
    required this.dateController,
    required this.phoneController,
    required this.professionController,
  }) : super(key: key);

  final GuestEntity item;

  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController dateController;
  final TextEditingController phoneController;
  final TextEditingController professionController;

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
        CustomBottomSheet(
          nameController: nameController,
          lastnameController: lastnameController,
          dateController: dateController,
          phoneController: phoneController,
          professionController: professionController,
          oldGuest: item,
          child: Icon(
            Icons.edit,
            size: 20.w,
            color: Palette.grey,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          child: Icon(
            Icons.delete_forever,
            size: 20.w,
            color: Palette.grey,
          ),
          onTap: () {
            context.read<GuestListBloc>().add(DeleteGuest(item));
          },
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
