import 'package:birthday_app/common/strings.dart';
import 'package:birthday_app/data/models/guest_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> addGuest(GuestModel guest) async {
    final guestBox = Hive.box<GuestModel>('guests');

    await guestBox.add(guest);
  }

  static Future<List<GuestModel>> getGuests() async {
    final guestBox = Hive.box<GuestModel>('guests');
    final guests = guestBox.values.toList();

    return guests;
  }

  static Future<void> deleteGuest(GuestModel guest) async {
    final guestBox = Hive.box<GuestModel>('guests');
    guestBox.delete(guest.id);
  }

  static Future<void> upodateGuest(GuestModel newGuest) async {
    final guestBox = Hive.box<GuestModel>('guests');
    guestBox.put(newGuest.id!, newGuest);
  }

  static Future<List<GuestModel>> sortGuests(String sortArgument) async {
    final guestBox = Hive.box<GuestModel>('guests');
    final guests = guestBox.values.toList();

    Map<String, List<GuestModel>> sortedLists = {
      Strings.byName: List.from(guests)
        ..sort((a, b) => a.name.compareTo(b.name)),
      Strings.byLastname: List.from(guests)
        ..sort((a, b) => a.surname.compareTo(b.surname)),
      Strings.byDate: List.from(guests)
        ..sort((a, b) => a.recordingDate.compareTo(b.recordingDate)),
      Strings.byAge: List.from(guests)
        ..sort((a, b) => b.birthday.compareTo(a.birthday))
    };

    return sortedLists[sortArgument]!;
  }
}
