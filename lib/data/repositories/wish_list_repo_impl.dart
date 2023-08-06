import 'package:birthday_app/data/datasources/remote/remote_datasource.dart';
import 'package:birthday_app/data/models/wish_list/wish_list_model.dart';
import 'package:birthday_app/domain/entities/wish_list_entity.dart';
import 'package:birthday_app/data/mappers/wishlist_data_mapper.dart';
import 'package:birthday_app/domain/repositories/wish_list_repository.dart';


class WishListRepositoryImpl implements WishListRepository{
  @override
  Future<void> addWish(WishEntity wish) async {
    RemoteDataSource.addWish(WishListDataMapper.fromEntity(wish));
  }

  @override
  Future<void> deleteWish(String id) async{
    RemoteDataSource.deleteData(id);
  }

  @override
  Future<List<WishEntity>> getWishes() async{
    final List<WishModel> wishModelsList = await RemoteDataSource.getData();

    final List<WishEntity> wishEntities = wishModelsList.map((wishModel) {
      return WishListDataMapper.toEntity(wishModel);
    }).toList();

    return wishEntities;

  }

  @override
  Future<void> updateWish(WishEntity wish) async{
    await RemoteDataSource.updateWish(WishListDataMapper.fromEntity(wish));
  }



}
