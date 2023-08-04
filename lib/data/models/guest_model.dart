import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'guest_model.freezed.dart';

part 'guest_model.g.dart';

@freezed
class GuestModel extends HiveObject with _$GuestModel {
  GuestModel._();

  @HiveType(typeId: 1)
  factory GuestModel({
    @HiveField(0)
    required int? id,
    @HiveField(1)
    required String name,
    @HiveField(2)
    required String surname,
    @HiveField(3)
    required DateTime birthday,
    @HiveField(4)
    required String phoneNumber,
    @HiveField(5)
    required String profession,
  }) = _GuestModel;




  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}