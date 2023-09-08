import 'dart:math';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/model/hotel_model.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.hotelModel});
  final HotelModel? hotelModel;

  @override
  Widget build(BuildContext context) {
    return hotelModel != null
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _rating(hotelModel!),
            _adresShort(hotelModel!),
            _adresLong(hotelModel!),
            _price(hotelModel!),
          ])
        : const SizedBox.shrink();
  }

  Widget _rating(HotelModel hotelModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Color(0x33FFC700),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFFFA800),
            ),
            Text(
              " ${hotelModel.rating} ${hotelModel.ratingName}",
              style: HotelTheme.textStyleRaiting,
            )
          ],
        ),
      ),
    );
  }

  Widget _adresShort(HotelModel hotelModel) {
    return Text(
      hotelModel.adress.split(',').first,
      style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _adresLong(HotelModel hotelModel) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: const Alignment(-1, 0),
          textStyle: HotelTheme.blueAdress),
      onPressed: () {},
      child: Text(
        hotelModel.adress,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _price(HotelModel hotelModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "от ${hotelModel.minimalPrice}",
            style: const TextStyle(
                textBaseline: TextBaseline.ideographic,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              hotelModel.priceForIt,
              style: HotelTheme.textStyle16_400Grey,
            ),
          ),
        ],
      ),
    );
  }
}

List<List<int>> func(List<List<int>> array) {
  if (array.length < 2) return array;
  array.sort((a, b) => a[0] - b[0]);
  var result = [array.removeAt(0)];
  for (var element in array) {
    if (result.last.last >= element.first) {
      result.last[1] = max(result.last.last, element.last);
    } else {
      result.add(element);
    }
  }


  return result;
}