import 'package:birthday_app/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/common/validator.dart';
import 'package:birthday_app/presentation/widgets/custom_appbar.dart';
import 'package:birthday_app/presentation/widgets/guest_list_bottom_sheet.dart';
import 'package:birthday_app/presentation/widgets/drop_down.dart';
import 'package:birthday_app/presentation/widgets/guest_list_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GuestListPage extends StatefulWidget {
  const GuestListPage({Key? key}) : super(key: key);

  @override
  State<GuestListPage> createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _professionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _dateController.dispose();
    _phoneController.dispose();
    _professionController.dispose();
    super.dispose();
  }

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
      body: BlocBuilder<GuestListBloc, GuestListState>(
        builder: (context, state) {
          return switch (state) {
            GuestListLoading _ =>
              const Center(child: CircularProgressIndicator()),
            GuestListLoaded _ => Stack(
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${state.guests.length} ${Validator.guestCountValid(state.guests.length)}",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.grey,
                                  height: 20.23 / 14.w),
                            ),
                            const DropDownList(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: ListView.builder(
                            itemExtent: 80.w,
                            shrinkWrap: true,
                            itemCount: state.guests.length,
                            itemBuilder: (context, int index) {
                              final item = state.guests[index];
                              return GuestListItem(
                                item: item,
                                nameController: _nameController,
                                lastnameController: _lastnameController,
                                dateController: _dateController,
                                phoneController: _phoneController,
                                professionController: _professionController,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 47.h, right: 32.w),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GuestListBottomSheet(
                        nameController: _nameController,
                        lastnameController: _lastnameController,
                        dateController: _dateController,
                        phoneController: _phoneController,
                        professionController: _professionController,
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
            GuestListError _ => Center(
                child: Text(state.message.toString()),
              )
          };
        },
      ),
    );
  }
}
