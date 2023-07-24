import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:birthday_app/feature/domain/entities/entertainments_entity.dart';
import 'package:birthday_app/feature/presentation/providers/expanded_provider.dart';
import 'package:birthday_app/feature/presentation/widgets/entertainments_item.dart';


class EntertainmentsList extends StatelessWidget {
  const EntertainmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expandedProvider = ExpandedProvider()..folding();
    return ListenableProvider(
      create: (_) => expandedProvider,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              child: ListView.builder(
                itemExtent: 58.w,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (Provider.of<ExpandedProvider>(context, listen: true)
                        .isExpanded)
                    ? 2
                    : entertainmentsList.length,
                itemBuilder: (context, int index) {
                  final item = entertainmentsList[index];
                  return EntertainmentsItem(item: item);
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
                    fontSize: 14.sp,
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
