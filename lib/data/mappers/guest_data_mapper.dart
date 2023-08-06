import 'package:birthday_app/data/models/guests/guest_model.dart';
import 'package:birthday_app/domain/entities/guest_entity.dart';

class GuestDataMapper {
  static GuestEntity toEntity(GuestModel guestModel) {
    return GuestEntity(
      guestModel.name,
      guestModel.surname,
      guestModel.birthday,
      guestModel.phoneNumber,
      guestModel.profession,
      guestModel.recordingDate,
      id: guestModel.key,
      pathToImage: guestModel.pathToImage
    );
  }

  static GuestModel fromEntity(GuestEntity guestEntity) {
    return GuestModel(
      id: guestEntity.id,
      name: guestEntity.name,
      surname: guestEntity.surname,
      birthday: guestEntity.birthday,
      phoneNumber: guestEntity.phoneNumber,
      profession: guestEntity.profession,
      recordingDate: guestEntity.recordingDate,
      pathToImage: guestEntity.pathToImage
    );
  }
}
