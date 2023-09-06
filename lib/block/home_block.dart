import 'package:effective/block/block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/widgets/end/end_widget.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    final error = !inputField.regExp.hasMatch(s);
    inputField.error = error;
    emit(InputDataTouristState(error: error, inputField: inputField));
  }

  hotelOrder(BuildContext context) {
    List<List<String>> errors = [];
    repository.touristsData.forEach((touristData) {
      touristData.inputField.forEach((inputField) {
        if (inputField.error || inputField.textEditingController.text.isEmpty) {
          errors.add([touristData.headerText, inputField.nameField]);
        }
      });
    });
    print('teg errors ${errors}');

    if (errors.isEmpty)
      Navigator.pushNamed(context, EndWidget.id);
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Center(child: Text('Неверно заполнены поля')),
                content: Column(
                    children: errors
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(e[0], maxLines: 3),
                                    ),
                                    Expanded(child: Text(e[1], maxLines: 3))
                                  ]),
                            ))
                        .toList()),
                actions: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.check))
                ],
              ));
    }
  }
}
