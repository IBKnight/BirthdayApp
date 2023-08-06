

import 'package:birthday_app/feature/domain/entities/wish_list_entity.dart';

abstract interface class WishListRepository{
  Future<void> addWish(WishEntity wish);
  Future<List<WishEntity>> getWishes();
  Future<void> deleteWish(String id);
  Future<void> updateWish(WishEntity wish);
}