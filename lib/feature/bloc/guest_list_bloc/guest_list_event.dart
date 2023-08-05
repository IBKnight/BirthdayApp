part of 'guest_list_bloc.dart';

@immutable
sealed class GuestListEvent {}

class LoadGuestList extends GuestListEvent {}

class AddGuest extends GuestListEvent {
  final GuestEntity newGuest;

  AddGuest(this.newGuest);
}

class UpdateGuest extends GuestListEvent {

  final GuestEntity newGuest;

  UpdateGuest(this.newGuest);

}

class DeleteGuest extends GuestListEvent {
  final GuestEntity guest;

  DeleteGuest(this.guest);
}

class SortGuest extends GuestListEvent{
  final String sortParam;

  SortGuest(this.sortParam);
}

