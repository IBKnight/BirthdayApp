import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/common/theme.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_appbar.dart';
import 'package:birthday_app/feature/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(
          Icons.chevron_left,
          size: 24.w,
          color: Palette.lightGrey,
        ),
        text: Strings.wishlist,
      ),
      body: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: ListView(),
                ),
              ),
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
                                    textEditingController: _titleController,
                                    labelText: Strings.title),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomTextField(
                                    textEditingController: _urlController,
                                    labelText: Strings.navigateToUrl),
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
                                    Strings.addGift,
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
