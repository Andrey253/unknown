import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/model/room_model.dart';
import 'package:flutter/material.dart';

class BlokHotel extends StatelessWidget {
  const BlokHotel({super.key, required this.roomModel});

  static const String id = '/RoomOrderWidget';
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
        padding: 16.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _rating(roomModel),
          _adresShort(roomModel),
          _adresLong(roomModel),
        ]));
  }

  Widget _rating(RoomModel hotelModel) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
            color: Color(0x33FFC700),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: HotelTheme.textRaitingColor,
            ),
            Text(
              " ${hotelModel.horating} ${hotelModel.ratingName}",
              style: HotelTheme.textStyleRaiting,
            )
          ],
        ),
      ),
    );
  }

  Widget _adresShort(RoomModel hotelModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        hotelModel.hotelAdress.split(',').first,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _adresLong(RoomModel hotelModel) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: const Alignment(-1, 0),
          textStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: HotelTheme.buttonBackgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      onPressed: () {},
      child: Text(
        hotelModel.hotelAdress,
        textAlign: TextAlign.start,
      ),
    );
  }
}
