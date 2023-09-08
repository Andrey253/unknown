// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

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
    emit(const StartState());
    final touristData = repository.addTourist();
    if (touristData != null) {
      emit(TouristState(touristsData: touristData));
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

  changeExpandedListTourist(int panelIndex, bool isExpanded) {
    emit(StartState());
    repository.touristsData[panelIndex].isExpanded = !isExpanded;
    emit(TouristState(touristsData: repository.touristsData[panelIndex]));
  }

  checkErrorTouristFields(String s, InputField inputField) {
    if (RegExp(r"^[0123]\d\.[01]\d\.[12]\d\d\d$").hasMatch(s)) {
      final list = s.split('.');
      try {
        final data = DateTime(
          int.parse(list[2]),
          int.parse(list[1]),
          int.parse(list[0]),
        );
        if (int.parse(list[0]) != data.day ||
            int.parse(list[1]) != data.month ||
            int.parse(list[2]) != data.year) {
          throw Exception();
        }
        inputField.error = false;
        inputField.textEditingController.text =
            '${data.day.toString().padLeft(2, '0')}.${data.month.toString().padLeft(2, '0')}.${data.year.toString().padLeft(4, '0')}';
        inputField.textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: inputField.textEditingController.text.length));
        //при правильном формате даты отображает сразу отсутствие ошибки
        emit(InputDataTouristState(error: false, inputField: inputField));
      } on Exception {
        inputField.error = true;
        // при не правильном формате введеной даты покажет ошибку сразу
        // emit(InputDataTouristState(error: true, inputField: inputField));
      }
    } else {
      final error = !inputField.regExp.hasMatch(s);
      if (!error) {
        inputField.error = error;
        emit(InputDataTouristState(error: error, inputField: inputField));
      }
      inputField.error = error;
    }
  }

  hotelOrder(BuildContext context) {
    List<List<String>> errorsTourist = [];
    List<List<String>> errorsBuyer = [];
    if (repository.phoneBuyerController.text.isEmpty) {
      errorsBuyer.add(['Телефон покупателя', 'не указан']);
      repository.phoneBuyerError = true;
    } else if (repository.phoneBuyerError) {
      errorsBuyer.add(['Телефон покупателя', 'указан неверно']);
    }
    if (repository.emailBuyerController.text.isEmpty) {
      errorsBuyer.add(['Email покупателя', 'не указан']);
      repository.emailBuyerError = true;
    } else if (repository.emailBuyerError) {
      errorsBuyer.add(['Email покупателя', 'указан неверно']);
    }
    for (var touristData in repository.touristsData) {
      for (var inputField in touristData.inputField) {
        if (inputField.error || inputField.textEditingController.text.isEmpty) {
          errorsTourist.add([touristData.headerText, inputField.nameField]);
          inputField.error = true;
          touristData.isExpanded = true;
          emit(InputDataTouristState(error: true, inputField: inputField));
        }
      }
    }

    if (errorsTourist.isEmpty && errorsBuyer.isEmpty) {
      generateOrderNumber();
      Navigator.pushNamed(context, FinishWidget.id);
    } else {
      print('teg ');

      // emit(StartState());
      emit(EditingInfoBuyerState(
          listTouristData: repository.touristsData,
          emailBuyerError: repository.emailBuyerError,
          phoneBuyerError: repository.phoneBuyerError));
    }
  }

  void validateEmailBuyer(String email) {
    repository.emailBuyerError = !RegExp(r"^\w+@\w+\.\w{2,}$").hasMatch(email);
    if (!repository.emailBuyerError) {
      repository.emailBuyer = email;
      emit(EditingInfoBuyerState(
          listTouristData: repository.touristsData,
          emailBuyerError: repository.emailBuyerError,
          phoneBuyerError: repository.phoneBuyerError));
    }
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
    if (!repository.phoneBuyerError) {
      emit(EditingInfoBuyerState(
          listTouristData: repository.touristsData,
          emailBuyerError: repository.emailBuyerError,
          phoneBuyerError: repository.phoneBuyerError));
    }
    repository.buferPhoneBuyer = mask;
    repository.phoneBuyerController.selection =
        TextSelection.fromPosition(TextPosition(offset: section));
  }

  void validatePhone(String s) => repository.phoneBuyerError =
      !RegExp(r"^\d{3}\)\s\d{3}\-\d\d\-\d\d$").hasMatch(s);

  finish(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    startingGetHotel();
  }

  void onTapPhoneBuer() {
    if (repository.phoneBuyerController.text.isEmpty) {
      repository.phoneBuyerController.text = '***) *** - ** - **';
      repository.phoneBuyerController.selection =
          TextSelection.fromPosition(const TextPosition(offset: 0));
      validatePhone(repository.phoneBuyerController.text);
    }
  }

  void onSubmittedPhoneBuyer(String value) {
    if (repository.phoneBuyerController.text.isEmpty ||
        repository.phoneBuyerError) {
      repository.phoneBuyerError = true;
      emit(EditingInfoBuyerState(
          listTouristData: repository.touristsData,
          emailBuyerError: repository.emailBuyerError,
          phoneBuyerError: repository.phoneBuyerError));
    }
  }

  void onSubmittedEmailBuyer(String value) {
    validateEmailBuyer(value);
    if (repository.emailBuyerController.text.isEmpty) {
      repository.emailBuyerError = true;
    }

    emit(EditingInfoBuyerState(
        listTouristData: repository.touristsData,
        emailBuyerError: repository.emailBuyerError,
        phoneBuyerError: repository.phoneBuyerError));
  }

  void generateOrderNumber() {
    repository.orderNumber = Random().nextInt(999999);
  }
}
