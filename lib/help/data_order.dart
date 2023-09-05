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
          const Text('Вылет из', style: textStyle),
          Text(roomModel.departure, style: textStyle2)
        ]),
        TableRow(children: [
          const Text('Вылет из', style: textStyle),
          Text(roomModel.departure, style: textStyle2)
        ]),
      ],
    ));
  }
}
