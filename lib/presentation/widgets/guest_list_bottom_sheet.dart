import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/common/theme.dart';
import 'package:birthday_app/domain/entities/guest_entity.dart';
import 'package:birthday_app/presentation/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:birthday_app/bloc/guest_list_bloc/guest_list_bloc.dart';

import 'package:birthday_app/presentation/widgets/text_field.dart';


class GuestListBottomSheet extends StatelessWidget {
  GuestListBottomSheet({Key? key,
    required this.nameController,
    required this.lastnameController,
    required this.dateController,
    required this.phoneController,
    required this.professionController,
    this.oldGuest,
    this.child})
      : super(key: key);

  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController dateController;
  final TextEditingController phoneController;
  final TextEditingController professionController;
  GuestEntity? oldGuest;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        if (oldGuest != null) {
          nameController.text = oldGuest!.name;
          lastnameController.text = oldGuest!.surname;
          dateController.text = "${oldGuest!.birthday.year}"
              "-${(oldGuest!.birthday.month).toString().padLeft(2, '0')}"
              "-${(oldGuest!.birthday.day).toString().padLeft(2, '0')}";
          phoneController.text = oldGuest!.phoneNumber;
          professionController.text = oldGuest!.profession;
        } else {
          nameController.text = '';
          lastnameController.text = '';
          dateController.text = '';
          phoneController.text = '';
          professionController.text = '';
        }

        showModalBottomSheet(
          barrierColor: Palette.barrier,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.w)),
          ),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom),
                child: Column(
                  children: [
                    Container(
                      height: 4.w,
                      width: 35.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Palette.lightGrey2),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                        textEditingController: nameController,
                        labelText: Strings.name),
                    SizedBox(height: 12.h),
                    CustomTextField(
                        textEditingController: lastnameController,
                        labelText: Strings.lastname),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      textEditingController: dateController,
                      labelText: Strings.birthdate,
                      suffixIcon: CustomDatePicker(textField: dateController),
                      isReadOnly: true,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      textEditingController: phoneController,
                      labelText: Strings.phoneNumber,
                      isNumbered: true,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                        textEditingController: professionController,
                        labelText: Strings.profession),
                    SizedBox(height: 50.h),
                    TextButton(
                      onPressed: () {
                        oldGuest != null
                            ? context.read<GuestListBloc>().add(
                          UpdateGuest(
                            GuestEntity(
                                nameController.text,
                                lastnameController.text,
                                DateTime.parse(dateController.text),
                                phoneController.text,
                                professionController.text,
                                oldGuest!.recordingDate,
                                id: oldGuest!.id),
                          ),
                        )
                            : context.read<GuestListBloc>().add(
                          AddGuest(
                            GuestEntity(
                              nameController.text,
                              lastnameController.text,
                              DateTime.parse(dateController.text),
                              phoneController.text,
                              professionController.text,
                              DateTime.now()
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      style:
                      AppTheme.lightTheme.textButtonTheme.style!.copyWith(
                        backgroundColor:
                        const MaterialStatePropertyAll(Palette.darkGreen),
                      ),
                      child: Text(
                        oldGuest != null ? Strings.updateGuest : Strings
                            .signUp,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 80.w)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
