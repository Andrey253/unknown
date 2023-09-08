// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/widgets/finish_widget/finish_widget.dart';
import 'package:effective/widgets/order/order_page.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';

import 'block_help.dart';

class AppBlock extends Cubit<AppState> {
  final Repository repository;
  AppBlock({
    required this.repository,
  }) : super(const StartState()) {
    startingGetHotel();
  }

  get finalPrice => spaceSeparateNumbers(repository.finalPrices.last.price);

  String spaceSeparateNumbers(s) => spaceSeparateNumbersHelp(s);

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

  void getRoomAndNavigate(BuildContext context) async {
    emit(const StartState());
    Navigator.pushNamed(context, RoomOrderWidget.id);

    final roomModel = await repository.apiServis.getRoom();
    repository.roomModel = roomModel;
    repository.setFinalPrice();
    emit(
        GetRoomState(roomModel: roomModel, finalPrice: repository.finalPrices));
  }

  addTourist(BuildContext context) {
    repository.allTouristsNoExpanded();
    emit(const AddingTouristState());
    final touristData = repository.addTourist();
    if (touristData != null) {
      emit(AddedTouristState(touristsData: touristData));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Достигнуто максимальное количество туристов',
                    maxLines: 10, style: HotelTheme.textStyle22_500Black),
                actions: actionOk(ctx),
              ));
    }
  }

  changeEpandedListTourist(int panelIndex, bool isExpanded) {
    repository.touristsData[panelIndex].isExpanded = !isExpanded;
    emit(ChangeExpandedtState(index: panelIndex, isExp: isExpanded));
  }

  checkErrorTouristFields(String s, InputField inputField) {
    final error = !inputField.regExp.hasMatch(s);
    inputField.error = error;
    emit(InputDataTouristState(error: error, inputField: inputField));
  }

  hotelOrder(BuildContext context) {
    List<List<String>> errors = [];
    if (repository.phoneBuyerController.text.isEmpty) {
      errors.add(['Телефон покупателя', 'не указан']);
    } else if (repository.phoneBuyerError) {
      errors.add(['Телефон покупателя', 'указан неверно']);
    }
    if (repository.emailBuyerController.text.isEmpty) {
      errors.add(['Email покупателя', 'не указан']);
    } else if (repository.emailBuyerError) {
      errors.add(['Email покупателя', 'указан неверно']);
    }
    for (var touristData in repository.touristsData) {
      for (var inputField in touristData.inputField) {
        if (inputField.error || inputField.textEditingController.text.isEmpty) {
          errors.add([touristData.headerText, inputField.nameField]);
        }
      }
    }

    if (errors.isEmpty) {
      Navigator.pushNamed(context, FinishWidget.id);
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Center(child: Text('Неверно заполнены поля')),
                content: SizedBox(
                  height: MediaQuery.of(ctx).size.height * 0.5,
                  width: MediaQuery.of(ctx).size.width * 0.8,
                  child: ListView(
                      children: errors
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(ctx).size.width * 0.3,
                                        child: Text(e[0],
                                            maxLines: 3,
                                            style: HotelTheme
                                                .textStyle16_500Black),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(ctx).size.width *
                                              0.3,
                                          child: Text(e[1],
                                              maxLines: 3,
                                              style: HotelTheme
                                                  .textStyle16_500Black))
                                    ]),
                              ))
                          .toList()),
                ),
                actions: actionOk(ctx),
              ));
    }
  }

  void validateEmailBuyer(String email) {
    if ((RegExp(r"^\w+@\w+\.\w{2,}$").hasMatch(email))) {
      repository.emailBuyerError = false;
      emit(EditingInfoBuyerState(
          value: email,
          errorPhone: repository.phoneBuyerError,
          errorEmail: repository.emailBuyerError));
    } else {
      repository.emailBuyerError = true;
      emit(EditingInfoBuyerState(
          value: email,
          errorPhone: repository.phoneBuyerError,
          errorEmail: repository.emailBuyerError));
    }
    repository.emailBuyer = email;
  }

  void onChangePhoneBuer(String s) {
    String phone = '';
    String mask = '***) ***-**-**';
    int section = 0;
    if (RegExp(r"\d\d\*\*").hasMatch(s) &&
        repository.buferPhoneBuyer.length > s.length) {
      s = s.replaceAll(RegExp(r"\d\*\*"), '');
    }
    if (RegExp(r"\d\)\*").hasMatch(s) &&
        repository.buferPhoneBuyer.length > s.length) {
      s = s.replaceAll(RegExp(r"\d\)\*"), '');
    }
    for (var char in s.characters) {
      if (RegExp(r"\d").hasMatch(char)) {
        phone = phone + char;

        mask = mask.replaceFirst(RegExp(r"\*"), char);
        if (RegExp(r"\*").hasMatch(mask)) {
          section = (mask).indexOf('*');
        } else {
          section = mask.length;
        }
      }
    }
    repository.phoneBuyer = phone;
    repository.phoneBuyerController.text = mask;
    validatePhone(mask);
    repository.buferPhoneBuyer = mask;
    repository.phoneBuyerController.selection =
        TextSelection.fromPosition(TextPosition(offset: section));
  }

  void validatePhone(String s) {
    if ((RegExp(r"^\d{3}\)\s\d{3}\-\d\d\-\d\d$").hasMatch(s))) {
      repository.phoneBuyerError = false;
      emit(EditingInfoBuyerState(
          value: s,
          errorPhone: repository.phoneBuyerError,
          errorEmail: repository.emailBuyerError));
    } else {
      repository.phoneBuyerError = true;
      emit(EditingInfoBuyerState(
          value: s,
          errorPhone: repository.phoneBuyerError,
          errorEmail: repository.emailBuyerError));
    }
  }

  finish(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    startingGetHotel();
  }
}
