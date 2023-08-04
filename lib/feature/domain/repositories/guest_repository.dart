import 'package:birthday_app/feature/domain/entities/guest_entity.dart';

abstract interface class GuestRepository{

  Future<void> addGuest(GuestEntity guest);
  Future<List<GuestEntity>> getGuests();
  Future<void> deleteGuest(GuestEntity guest);
  Future<void> updateGuest(GuestEntity guest);

}