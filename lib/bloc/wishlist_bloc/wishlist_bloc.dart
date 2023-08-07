import 'dart:async';

import 'package:birthday_app/domain/entities/wish_list_entity.dart';
import 'package:birthday_app/domain/repositories/wish_list_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final WishListRepository repository;

  WishListBloc({required this.repository}) : super(WishListLoading()) {
    on<LoadWishList>(_loadWishList);
    on<AddWish>(_addNewWish);
    on<UpdateWish>(_updateWish);
    on<DeleteWish>(_deleteWish);
  }

  Future<void> _loadWishList(LoadWishList event, Emitter<WishListState> emit) async {
    try {
      final List<WishEntity> wishes = await repository.getWishes();

      emit(WishListLoaded(wishes));
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }

  Future<void> _addNewWish(AddWish event, Emitter<WishListState> emit) async {
    try {
      await repository.addWish(event.newWish);

      final List<WishEntity> wishes = await repository.getWishes();

      emit(WishListLoaded(wishes));
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }

  Future<void> _updateWish(UpdateWish event, Emitter<WishListState> emit) async {
    try {
      await repository.updateWish(event.newWish);

      final List<WishEntity> wishes = await repository.getWishes();

      emit(WishListLoaded(wishes));
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }

  Future<void> _deleteWish(DeleteWish event, Emitter<WishListState> emit) async {
    try {
      await repository.deleteWish(event.id);

      final List<WishEntity> wishes = await repository.getWishes();

      emit(WishListLoaded(wishes));
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }
}
