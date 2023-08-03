part of 'guest_list_bloc.dart';

@immutable
sealed class GuestListEvent {}


class LoadGuestList extends GuestListEvent { }
class AddGuest extends GuestListEvent { }
class UpdateGuest extends GuestListEvent { }
class DeleteGuest extends GuestListEvent { }
