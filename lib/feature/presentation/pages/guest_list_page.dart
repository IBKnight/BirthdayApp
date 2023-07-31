import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/common/theme.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_appbar.dart';
import 'package:birthday_app/feature/presentation/widgets/drop_down.dart';
import 'package:birthday_app/feature/presentation/widgets/text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestListPage extends StatelessWidget {
  GuestListPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(
          Icons.chevron_left,
          size: 24.w,
          color: Palette.lightGrey,
        ),
        text: Strings.guestsList,
      ),
      body: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2 гостя",
                      style: TextStyle(fontSize: 14.sp, color: Palette.grey),
                    ),
                    const DropDownList(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView(),
                ),
              ),
              SizedBox(height: 16.h)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 47.h, right: 32.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0.w)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 36.h,
                                left: 16.w,
                                right: 16.w,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              children: [
                                CustomTextField(
                                    textEditingController: _nameController,
                                    labelText: Strings.name),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomTextField(
                                    textEditingController: _lastnameController,
                                    labelText: Strings.lastname),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomTextField(
                                    textEditingController: _dateController,
                                    labelText: Strings.birthdate,
                                suffixIcon: const Icon(Icons.calendar_today_outlined),
                                    onPressed: () => print(123),
                                    ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomTextField(
                                    textEditingController: _phoneController,
                                    labelText: Strings.phoneNumber),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomTextField(
                                    textEditingController:
                                        _professionController,
                                    labelText: Strings.profession),
                                SizedBox(height: 50.h),
                                TextButton(
                                  onPressed: () {},
                                  style: AppTheme
                                      .lightTheme.textButtonTheme.style!
                                      .copyWith(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Palette.darkGreen)),
                                  child: Text(
                                    Strings.signUp,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 150.h)
                              ],
                            ),
                          ),
                        );
                      });
                },
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
