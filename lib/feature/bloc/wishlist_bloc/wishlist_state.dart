part of 'wishlist_bloc.dart';

@immutable
sealed class WishListState {}

class WishListLoading extends WishListState {}

class WishListLoaded extends WishListState {
  List<WishEntity> wishes;

  WishListLoaded(this.wishes);

}
class WishListError extends WishListState {
  final String message;

  WishListError(this.message);
}
