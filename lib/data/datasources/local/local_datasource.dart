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
}
