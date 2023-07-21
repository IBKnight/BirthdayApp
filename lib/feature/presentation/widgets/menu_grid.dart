import 'package:birthday_app/feature/presentation/providers/expanded_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:birthday_app/feature/domain/entities/card_entity.dart';

class MenuGrid extends StatelessWidget {
  MenuGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => ExpandedProvider(),
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0.h),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 32.w,
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                ),
                //mainAxisSpacing: 20.h,
                shrinkWrap: true,
                itemCount: (Provider.of<ExpandedProvider>(context, listen: true)
                        .isExpanded)
                    ? 2
                    : cardList.length,
                itemBuilder: (context, int index) {
                  final item = cardList[index];
                  return Column(
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
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 12.h,
            // ),
            GestureDetector(
              onTap: () => Provider.of<ExpandedProvider>(context, listen: false)
                  .folding(),
              child: RichText(
                text: TextSpan(
                  text: Provider.of<ExpandedProvider>(context, listen: true)
                      .foldText,
                  style: GoogleFonts.jost(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 14.sp
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}