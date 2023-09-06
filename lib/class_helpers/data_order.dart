import 'package:effective/class_helpers/my_container.dart';
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
    const textStyle = TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Color(0xFF828796),
        fontSize: 16,
        fontWeight: FontWeight.w400);
    const textStyle2 = TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400);
    return MyContainer(
        child: Table(
      children: [
        TableRow(children: [
          //one
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Вылет из', style: textStyle),
          ),
          Text(roomModel.departure, style: textStyle2)
        ]),
        TableRow(children: [
          //two
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Страна, Город', style: textStyle),
          ),
          Text(roomModel.arrivalCountry, style: textStyle2)
        ]),
        TableRow(children: [
          //three
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Даты', style: textStyle),
          ),
          Text('${roomModel.tourDateStart} - ${roomModel.tourDateStop}',
              style: textStyle2)
        ]),
        TableRow(children: [
          //four
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Кол-во ночей', style: textStyle),
          ),
          Text('${roomModel.numberOfNights} ночей', style: textStyle2)
        ]),
        TableRow(children: [
          //five
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Отель', style: textStyle),
          ),
          Text(roomModel.hotelAdress.split(',').first, style: textStyle2)
        ]),
        TableRow(children: [
          //sex
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Номер', style: textStyle),
          ),
          Text(roomModel.room, style: textStyle2)
        ]),
        TableRow(children: [
          //seven
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Питание', style: textStyle),
          ),
          Text(roomModel.nutrition, style: textStyle2)
        ]),
      ],
    ));
  }
}
