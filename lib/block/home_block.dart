import 'package:effective/block/block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';

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
    repository.setFinalPrice();
    emit(
        GetRoomState(roomModel: roomModel, finalPrice: repository.finalPrices));
  }

  addTourist() {
    repository.allTouristsNoExpanded();
    emit(const AddingTouristState());
    final touristData = repository.addTourist();
    if (touristData != null) {
      emit(AddedTouristState(touristsData: touristData));
    } else {
      emit(const NoAddTouristState());
    }
  }

  changeEpanded(int panelIndex, bool isExpanded) {
    repository.touristsData[panelIndex].isExpanded = !isExpanded;
    emit(ChangeExpandedtState(index: panelIndex, isExp: isExpanded));
  }

  checkErrorFields(String s, InputField inputField) {
    final error = inputField.regExp.hasMatch(s);
    inputField.error = !error;
    emit(InputDataTouristState(error: !error,inputField:inputField));
  }
}
