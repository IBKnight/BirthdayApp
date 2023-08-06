import 'package:hive/hive.dart';

part 'guest_model.g.dart';

@HiveType(typeId: 1)
class GuestModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String surname;
  @HiveField(3)
  DateTime birthday;
  @HiveField(4)
  String phoneNumber;
  @HiveField(5)
  String profession;
  @HiveField(6)
  DateTime recordingDate;
  @HiveField(7)
  String? pathToImage;

  GuestModel(
      {this.id,
      required this.name,
      required this.surname,
      required this.birthday,
      required this.phoneNumber,
      required this.profession,
      required this.recordingDate,
      this.pathToImage});
}
