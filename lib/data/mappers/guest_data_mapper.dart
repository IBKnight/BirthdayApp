
import 'package:birthday_app/data/models/guest_model.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';

class GuestDataMapper {
  static GuestEntity toEntity(GuestModel guestModel) {
    return GuestEntity(
      guestModel.name,
      guestModel.surname,
      guestModel.birthday,
      guestModel.phoneNumber,
      guestModel.profession,
    );
  }

  static GuestModel fromEntity(GuestEntity guestEntity) {
    return GuestModel(
      name: guestEntity.name,
      surname: guestEntity.surname,
      birthday: guestEntity.birthday,
      phoneNumber: guestEntity.phoneNumber,
      profession: guestEntity.profession,
    );
  }
}
