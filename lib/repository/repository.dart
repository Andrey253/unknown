// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:effective/helpers/final_price_class.dart';
import 'package:flutter/material.dart';
import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/servis/api_servis.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';

class Repository {
  ApiServis apiServis = ApiServis(Dio());
  int indexIndicator = 0;
  HotelModel? hotelModel;
  List<RoomsModel> listRooms = [];
  TextEditingController phoneBuyerController = TextEditingController();
  TextEditingController emailBuyerController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  RoomModel? roomModel;

  String phoneBuyer = '';
  String emailBuyer = '';
  String buferPhoneBuyer = '';
  int orderNumber = 0;

  List<TouristData> touristsData = [];
  List<FinalPrice> finalPrices = [];

  bool emailBuyerError = false;
  bool phoneBuyerError = false;

  int maxTourists = 9;

  Repository() {
    touristsData = [initTourist()];
  }
  TouristData initTourist() {
    return TouristData(
      isExpanded: true,
      headerText: numberTourist(),
      inputField: [
        InputField(
            regExp: RegExp(r"^[a-zA-Zа-яА-Я\s\-]{2,20}$", unicode: true),
            textEditingController: TextEditingController(),
            nameField: 'Имя',
            error: false,
            hintText: 'Минимум 2 символа не более 20'),
        InputField(
            regExp: RegExp(r"^[a-zA-Zа-яА-Я\s\-]{2,20}$"),
            textEditingController: TextEditingController(),
            nameField: 'Фамилия',
            error: false,
            hintText: 'Минимум 2 символа не более 20'),
        InputField(
            regExp: RegExp(r"^[0123]\d\.[01]\d\.[12]\d\d\d$"),
            textEditingController: TextEditingController(),
            nameField: 'Дата рождения',
            error: false,
            hintText: '**.**.****'),
        InputField(
            regExp: RegExp(r"^[a-zA-Zа-яА-Я]{4,20}$"),
            textEditingController: TextEditingController(),
            nameField: 'Гражданство',
            error: false,
            hintText: 'Минимум 4 символа не более 20'),
        InputField(
            regExp: RegExp(r"^[a-zA-Z0-9\s]{6,20}$"),
            textEditingController: TextEditingController(),
            nameField: 'Номер загранпаспорта',
            error: false,
            hintText: 'Минимум 6 символов не более 20'),
        InputField(
            regExp: RegExp(r"^[0123]\d\.[01]\d\.[12]\d\d\d$"),
            textEditingController: TextEditingController(),
            nameField: 'Срок действия загранпаспорта',
            error: false,
            hintText: '**.**.****'),
      ],
    );
  }

  List<String> numbers = const [
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
  String numberTourist() => numbers[touristsData.length];

  TouristData? addTourist() {
    if (touristsData.length > maxTourists) return null;
    final tourist = initTourist();
    touristsData.add(tourist);
    return tourist;
  }

  void setFinalPrice() {
    finalPrices = [
      FinalPrice('Тур', roomModel?.tourPrice ?? 0, 0),
      FinalPrice('Топливный сбор', roomModel?.fuelCharge ?? 0, 0),
      FinalPrice('Сервисный сбор', roomModel?.serviceCharge ?? 0, 0),
      FinalPrice(
          'К оплате',
          roomModel!.tourPrice +
              roomModel!.serviceCharge +
              roomModel!.fuelCharge,
          1),
    ];
  }

  void allTouristsNoExpande() {
    for (var element in touristsData) {
      element.isExpanded = false;
    }
  }
}
