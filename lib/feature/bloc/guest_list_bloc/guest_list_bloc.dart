import 'package:birthday_app/data/repositories/guest_repo_impl.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'guest_list_event.dart';

part 'guest_list_state.dart';

class GuestListBloc extends Bloc<GuestListEvent, GuestListState> {
  GuestListBloc() : super(GuestListLoading()) {

    final repository = GuestRepositoryImpl();

    on<LoadGuestList>((event, emit) async {
      try {
        await Future.delayed(const Duration(milliseconds: 1000));

        // final repository = GuestRepositoryImpl();
        final List<GuestEntity> guests = await repository.getGuests();

        emit(GuestListLoaded(guests));
      } catch (e) {
        emit(GuestListError(e.toString()));
      }
    });

    on<AddGuest>((event, emit) async {
      try {
        await repository.addGuest(event.newGuest);
        final List<GuestEntity> guests = await repository.getGuests();
        emit(GuestListLoaded(guests));
      } catch (e) {
        emit(GuestListError(e.toString()));
      }
    });


    on<DeleteGuest>((event, emit) async {
      try {

        final repository = GuestRepositoryImpl();
      } catch (e) {
        emit(GuestListError(e.toString()));
      }
    });

  }

}