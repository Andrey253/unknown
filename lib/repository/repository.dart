// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/servis/api_servis.dart';
import 'package:effective/widgets/order/tourists/expansion_class.dart';

class Repository {
  ApiServis apiServis =
      ApiServis(Dio(BaseOptions(contentType: 'aplication/json')));
  int indexIndicator = 0;
  HotelModel? hotelModel;
  List<RoomsModel> listRooms = [];

  RoomModel? roomModel;

  String? phoneBuyer;

  String? emailBuyer;
  List<ExpansionPanelData> touristsData = [];
  Repository() {
    touristsData = [initTourist()];
  }
  ExpansionPanelData initTourist() {
    return ExpansionPanelData(
      isExpanded: true,
      headerText: numberTourist(),
      inputField: [
        InputField(
            textEditingController: TextEditingController(), nameField: 'Имя'),
        InputField(
            textEditingController: TextEditingController(),
            nameField: 'Фамилия'),
        InputField(
            textEditingController: TextEditingController(),
            nameField: 'Дата рождения'),
        InputField(
            textEditingController: TextEditingController(),
            nameField: 'Гражданство'),
        InputField(
            textEditingController: TextEditingController(),
            nameField: 'Номер загранпаспорта'),
        InputField(
            textEditingController: TextEditingController(),
            nameField: 'Срок действия загранпаспорта'),
      ],
    );
  }

  String numberTourist() {
    List<String> numbers = [
      'Первый турист',
      'Второй турист',
      'Третий турист',
      'Четвертый турист',
      'Пятый турист',
      'Шестой турист',
      'Седьмой турист',
      'Восьмой турист',
      'Девятый турист',
      'Десятый турист',
    ];
    return numbers[touristsData.length];
  }

  bool addTourist() {
    if (touristsData.length > 9) return false;
    touristsData.add(initTourist());
    return true;
  }
}
