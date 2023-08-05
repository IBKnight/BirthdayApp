import 'package:birthday_app/common/validator.dart';
import 'package:birthday_app/feature/bloc/guest_list_bloc/guest_list_bloc.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:birthday_app/feature/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:birthday_app/common/palette.dart';
import 'package:image_picker/image_picker.dart';

class GuestListItem extends StatefulWidget {
  const GuestListItem({
    Key? key,
    required this.item,
    required this.nameController,
    required this.lastnameController,
    required this.dateController,
    required this.phoneController,
    required this.professionController,
  }) : super(key: key);

  final GuestEntity item;

  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController dateController;
  final TextEditingController phoneController;
  final TextEditingController professionController;

  @override
  State<GuestListItem> createState() => _GuestListItemState();
}

class _GuestListItemState extends State<GuestListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            String? _pickedImage = await _pickImageFromGallery();

            context.read<GuestListBloc>().add(UpdateGuest(
                  GuestEntity(
                      widget.item.name,
                      widget.item.surname,
                      widget.item.birthday,
                      widget.item.phoneNumber,
                      widget.item.profession,
                      widget.item.recordingDate,
                      id: widget.item.id,
                      pathToImage: _pickedImage!),
                ));
          },
          child: CircleAvatar(
            minRadius: 21.r,
            backgroundColor: Palette.lightGrey3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(41.r),
              child: widget.item.pathToImage != null
                  ? Image.file(
                      File(widget.item.pathToImage!),
                      width: 64.w,
                      height: 64.w,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/guest_default.png',
                      width: 64.w,
                      height: 64.w,
                      fit: BoxFit.cover,
                    ),
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
                '${widget.item.name} ${widget.item.surname}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Palette.greenishBlack,
                ),
              ),
              Text(
                '${calculateAge(widget.item.birthday)} ${yearValid(calculateAge(widget.item.birthday))}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
              Text(
                widget.item.profession,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Palette.grey,
                ),
              ),
            ],
          ),
        ),
        CustomBottomSheet(
          nameController: widget.nameController,
          lastnameController: widget.lastnameController,
          dateController: widget.dateController,
          phoneController: widget.phoneController,
          professionController: widget.professionController,
          oldGuest: widget.item,
          child: Icon(
            Icons.edit,
            size: 20.w,
            color: Palette.grey,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          child: Icon(
            Icons.delete_forever,
            size: 20.w,
            color: Palette.grey,
          ),
          onTap: () {
            context.read<GuestListBloc>().add(DeleteGuest(widget.item));
          },
        ),
      ],
    );
  }

  int calculateAge(DateTime birthDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  Future<String?> _pickImageFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) return image!.path;
  }
}
