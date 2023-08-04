import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'guest_model.g.dart';

@HiveType(typeId: 1)
class GuestModel extends HiveObject{



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


    GuestModel(
        {this.id,
      required this.name,
      required this.surname,
      required this.birthday,
      required this.phoneNumber,
      required this.profession});
}