import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/common/theme.dart';
import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_date_picker.dart';
import 'package:birthday_app/feature/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key,
      required this.nameController,
      required this.lastnameController,
      required this.dateController,
      required this.phoneController,
      required this.professionController})
      : super(key: key);

  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController dateController;
  final TextEditingController phoneController;
  final TextEditingController professionController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 84.w,
          height: 84.w,
          decoration: const BoxDecoration(
              color: Palette.darkGreen, shape: BoxShape.circle),
          child: Icon(
            Icons.add_rounded,
            size: 84.w,
            color: Colors.white,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
              barrierColor: Palette.barrier,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0.w)),
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
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
                          suffixIcon:
                              CustomDatePicker(textField: dateController),
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
                            context.read<GuestListBloc>().add(
                                  AddGuest(
                                    GuestEntity(
                                      nameController.text,
                                      lastnameController.text,
                                      DateTime.parse(dateController.text),
                                      phoneController.text,
                                      professionController.text,
                                    ),
                                  ),
                                );
                          },
                          style: AppTheme.lightTheme.textButtonTheme.style!
                              .copyWith(
                            backgroundColor: const MaterialStatePropertyAll(
                                Palette.darkGreen),
                          ),
                          child: Text(
                            Strings.signUp,
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
              });
        });
  }
}
