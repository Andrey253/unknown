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

  void getRoom() async {
    emit(const StartState());
    final roomModel = await repository.apiServis.getRoom();
    repository.roomModel = roomModel;
    emit(GetRoomState(roomModel: roomModel));
  }

  addTourist() {
    final created = repository.addTourist();
    print('teg addState ${created}');
    emit(AddTouristState(
        created: created, touristsData: repository.touristsData));
  }

  changeEpanded(int panelIndex, bool isExpanded) {
    repository.touristsData[panelIndex].isExpanded = !isExpanded;
    print('teg ChangeExpandedtState panelIndex $panelIndex');
    emit(ChangeExpandedtState(index: panelIndex, isExp: isExpanded));
  }
}
