import 'package:effective/block/block.dart';
import 'package:effective/block/home_state.dart';

class HomeBloc extends AppBlock<HomeState> {
  HomeBloc({required super.repository, required super.type}) {
    init();
  }

  void init() async {
    startingGetHotel();
  }

  void startingGetHotel() async {
      emit(const StartState());
    final hotel = await repository.apiServis.getHotel();
    repository.hotelModel = hotel;
    emit(GetHotelState(hotelModel: hotel));
  }

  void getRooms() async {

    emit(const StartState());
    final rooms = await repository.apiServis.getRooms();
    repository.listRooms = rooms.listRooms;
    emit(GetRoomsState(listRooms: rooms.listRooms));
  }
}
