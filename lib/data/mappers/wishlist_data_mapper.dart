import 'package:birthday_app/data/models/wish_list/wish_list_model.dart';
import 'package:birthday_app/feature/domain/entities/wish_list_entity.dart';

class WishListDataMapper {
  static WishEntity toEntity(WishModel wishListModel) {
    return WishEntity(
        id: wishListModel.id,
        title: wishListModel.title,
        url: wishListModel.url,
        isPicked: wishListModel.isPicked);
  }

  static WishModel fromEntity(WishEntity wishListEntity) {
    return WishModel(
        id: wishListEntity.id,
        title: wishListEntity.title,
        url: wishListEntity.url,
        isPicked: wishListEntity.isPicked);
  }
}
