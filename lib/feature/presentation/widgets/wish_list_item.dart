import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/feature/bloc/wishlist_bloc/wishlist_bloc.dart';
import 'package:birthday_app/feature/domain/entities/wish_list_entity.dart';
import 'package:birthday_app/feature/presentation/widgets/hyper_text_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({Key? key, required this.item}) : super(key: key);

  final WishEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            HyperTextUnderline(url: item.url),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              child: Icon(
                Icons.delete_forever,
                size: 20.w,
                color: Palette.grey,
              ),
              onTap: () {
                context.read<WishListBloc>().add(DeleteWish(item.id!));
              },
            ),
            SizedBox(width: 20.w,),
            GestureDetector(
              onTap: () {
                context.read<WishListBloc>().add(
                      UpdateWish(
                        WishEntity(
                            title: item.title,
                            url: item.url,
                            isPicked: !item.isPicked,
                            id: item.id),
                      ),
                    );
              },
              child: Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                    color: item.isPicked ? Palette.grey : Palette.lightGrey,
                    shape: BoxShape.circle),
              ),
            ),
          ],
        )
      ],
    );
  }
}
