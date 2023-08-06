import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/domain/entities/entertainments_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:birthday_app/presentation/widgets/entertainments_item.dart';


class EntertainmentsList extends StatefulWidget {
  const EntertainmentsList({Key? key}) : super(key: key);

  @override
  State<EntertainmentsList> createState() => _EntertainmentsListState();
}

class _EntertainmentsListState extends State<EntertainmentsList> {
  bool _isExpanded = true;
  String _foldText = Strings.expand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          child: ListView.builder(
            itemExtent: 58.w,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _isExpanded ? 2 : entertainmentsList.length,
            itemBuilder: (context, int index) {
              final item = entertainmentsList[index];
              return EntertainmentsItem(item: item);
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              _foldText = (_isExpanded) ? Strings.expand : Strings.collapse;
            });
          },
          child: RichText(
            text: TextSpan(
              text: _foldText,
              style: GoogleFonts.jost(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 14.sp,
                height: 20.h/14.sp
              ),
            ),
          ),
        ),
      ],
    );
  }
}
