import 'package:birthday_app/feature/presentation/providers/expanded_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:birthday_app/feature/domain/entities/entertainments_entity.dart';

class EntertaimentsList extends StatelessWidget {
  const EntertaimentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => ExpandedProvider(),
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              child: ListView.builder(
                itemExtent: 58.h,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (Provider.of<ExpandedProvider>(context, listen: true)
                        .isExpanded)
                    ? 2
                    : entertainmentsList.length,
                itemBuilder: (context, int index) {
                  final item = entertainmentsList[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(41),
                          child: Image.asset(
                            item.image,
                            width: 42.r,
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
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(78, 67, 67, 1)),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right,
                          size: 20.w, color: Color.fromRGBO(78, 67, 67, 1)),
                    ],
                  );
                  //   ListTile(
                  //     title: Text(
                  //     item.title,
                  //     style: TextStyle(
                  //         fontSize: 14.sp, fontWeight: FontWeight.w500),
                  //   ),
                  //   leading: ClipRRect(
                  //     borderRadius: BorderRadius.circular(41),
                  //     child: Image.asset(
                  //       item.image,
                  //       width: 50.r,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   subtitle: Text(
                  //     item.subtitle,
                  //     style: TextStyle(fontSize: 14.sp),
                  //   ),
                  // );
                },
              ),
            ),
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
                      fontSize: 14.sp),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
