import 'package:effective/helpers/hotel_theme.dart';
import 'package:effective/helpers/container_circle_border.dart';
import 'package:effective/model/room_model.dart';
import 'package:flutter/material.dart';

class DataOrdersWidget extends StatelessWidget {
  const DataOrdersWidget({
    super.key,
    required this.roomModel,
  });
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
        padding: 16.0,
        child: Table(
          children: [
            TableRow(children: [
              //one
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Вылет из',
                    style: HotelTheme.textStyle16_400Grey, maxLines: 10),
              ),
              Text(roomModel.departure,
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
            TableRow(children: [
              //two
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Страна, Город',
                    style: HotelTheme.textStyle16_400Grey, maxLines: 10),
              ),
              Text(roomModel.arrivalCountry,
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
            TableRow(children: [
              //three
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Даты',
                    style: HotelTheme.textStyle16_400Grey, maxLines: 10),
              ),
              Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('${roomModel.tourDateStart} - ${roomModel.tourDateStop}',
                    style: HotelTheme.textStyle16_400Black, maxLines: 10),
              )
            ]),
            TableRow(children: [
              //four
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Кол-во ночей',
                    style: HotelTheme.textStyle16_400Grey, maxLines: 10),
              ),
              Text('${roomModel.numberOfNights} ночей',
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
            TableRow(children: [
              //five
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Отель', style: HotelTheme.textStyle16_400Grey),
              ),
              Text(roomModel.hotelAdress.split(',').first,
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
            TableRow(children: [
              //sex
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Номер', style: HotelTheme.textStyle16_400Grey),
              ),
              Text(roomModel.room,
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
            TableRow(children: [
              //seven
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Питание', style: HotelTheme.textStyle16_400Grey),
              ),
              Text(roomModel.nutrition,
                  style: HotelTheme.textStyle16_400Black, maxLines: 10)
            ]),
          ],
        ));
  }
}
