part of 'guest_list_bloc.dart';

sealed class GuestListState {}

class GuestListLoading extends GuestListState {}
class GuestListLoaded extends GuestListState {
  // final GuestRepositoryImpl repository;
  // GuestListLoaded(this.repository);
  List<GuestEntity> guests;

  GuestListLoaded(this.guests);
}

class GuestListError extends GuestListState {
  final String message;

  GuestListError(this.message);
}
