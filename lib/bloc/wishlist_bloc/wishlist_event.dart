part of '../../../bloc/wishlist_bloc/wishlist_bloc.dart';

@immutable
sealed class WishListEvent {}

class LoadWishList extends WishListEvent {}

class AddWish extends WishListEvent {
  final WishEntity newWish;

  AddWish(this.newWish);
}

class UpdateWish extends WishListEvent {
  final WishEntity newWish;

  UpdateWish(this.newWish);
}

class DeleteWish extends WishListEvent {
  final String id;

  DeleteWish(this.id);
}
