import 'package:birthday_app/data/datasources/local/local_datasource.dart';
import 'package:birthday_app/data/mappers/guest_data_mapper.dart';
import 'package:birthday_app/data/models/guest_model.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:birthday_app/feature/domain/repositories/guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository{

  @override
  Future<void> addGuest(GuestEntity guest) async{
    await LocalDataSource.addGuest(GuestDataMapper.fromEntity(guest));
  }

  @override
  Future<List<GuestEntity>> getGuests() async{

    final List<GuestModel> guestModels = await LocalDataSource.getGuests();

    final List<GuestEntity> guestEntities = guestModels.map((guestModel) {
      return GuestDataMapper.toEntity(guestModel);
    }).toList();

    return guestEntities;
  }


}