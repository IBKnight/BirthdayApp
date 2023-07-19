import 'package:birthday_app/feature/presentation/providers/ExpandedProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (Provider.of<ExpandedProvider>(context, listen: true).isExpanded)
                    ? 2
                    : entertainmentsList.length,
                itemBuilder: (context, int index) {
                  final item = entertainmentsList[index];
                  return ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
                      ),
                      leading: Image.asset(
                        item.image,
                        height: 42.h,
                        width: 42.h,
                      ),
                      trailing: Icon(Icons.chevron_right, size: 25.w,),
                      subtitle: Text(item.subtitle, style: TextStyle(fontSize: 14.sp),),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () => Provider.of<ExpandedProvider>(context, listen: false)
                  .folding(),
              child: Text(
                Provider.of<ExpandedProvider>(context, listen: true).foldText,
                style: TextStyle(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
