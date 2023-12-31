import 'package:birthday_app/domain/entities/guest_entity.dart';
import 'package:birthday_app/domain/repositories/guest_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../../bloc/guest_list_bloc/guest_list_event.dart';

part 'guest_list_state.dart';

class GuestListBloc extends Bloc<GuestListEvent, GuestListState> {
  final GuestRepository repository;

  GuestListBloc({required this.repository}) : super(GuestListLoading()) {
    on<LoadGuestList>(_loadGuestList);
    on<AddGuest>(_addGuest);
    on<DeleteGuest>(_deleteGuest);
    on<UpdateGuest>(_updateGuest);
    on<SortGuest>(_sortingGuest);
  }

  Future<void> _loadGuestList(
      LoadGuestList event, Emitter<GuestListState> emit) async {
    try {

      final List<GuestEntity> guests = await repository.getGuests();

      emit(GuestListLoaded(guests));
    } catch (e) {
      emit(GuestListError(e.toString()));
    }
  }

  Future<void> _addGuest(AddGuest event, Emitter<GuestListState> emit) async {
    try {
      await repository.addGuest(event.newGuest);
      final List<GuestEntity> guests = await repository.getGuests();
      emit(GuestListLoaded(guests));
    } catch (e) {
      emit(GuestListError(e.toString()));
    }
  }

  Future<void> _deleteGuest(
      DeleteGuest event, Emitter<GuestListState> emit) async {
    try {
      await repository.deleteGuest(event.guest);

      final List<GuestEntity> guests = await repository.getGuests();
      emit(GuestListLoaded(guests));
    } catch (e) {
      emit(GuestListError(e.toString()));
    }
  }

  Future<void> _updateGuest(
      UpdateGuest event, Emitter<GuestListState> emit) async {
    try {
      await repository.updateGuest(event.newGuest);

      final List<GuestEntity> guests = await repository.getGuests();

      emit(GuestListLoaded(guests));
    } catch (e) {
      emit(GuestListError(e.toString()));
    }
  }

  Future<void> _sortingGuest(
      SortGuest event, Emitter<GuestListState> emit) async {
    try {
      final List<GuestEntity> guests =
          await repository.sortGuests(event.sortParam);

      emit(GuestListLoaded(guests));
    } catch (e) {
      emit(GuestListError(e.toString()));
    }
  }
}
