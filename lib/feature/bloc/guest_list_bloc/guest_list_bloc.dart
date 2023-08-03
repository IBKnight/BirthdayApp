import 'package:birthday_app/data/repositories/guest_repo_impl.dart';
import 'package:birthday_app/feature/domain/entities/guest_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'guest_list_event.dart';
part 'guest_list_state.dart';

class GuestListBloc extends Bloc<GuestListEvent, GuestListState> {
  GuestListBloc() : super(GuestListLoading()) {
    on<LoadGuestList>((event, emit) async {
      try {

        final repository = GuestRepositoryImpl();
        final List<GuestEntity> guests = await repository.getGuests();

        emit(GuestListLoaded(guests));
      } catch (e) {
        emit(GuestListError(e.toString()));
      }
    });
  }
}
