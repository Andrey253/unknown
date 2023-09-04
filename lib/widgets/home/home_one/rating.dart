import 'package:effective/model/hotel_model.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.hotelModel});
  final HotelModel? hotelModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: hotelModel!=null ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _rating(hotelModel!),
          _adresShort(hotelModel!),
          _adresLong(hotelModel!),
          _price(hotelModel!),
        ]): const SizedBox.shrink());
  }

  Widget _rating(HotelModel hotelModel) {
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
              color: Color(0xFFFFA800),
            ),
            Text(
              " ${hotelModel.rating} ${hotelModel.ratingName}",
              style: const TextStyle(
                  wordSpacing: 4,
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFFFFA800),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _adresShort(HotelModel hotelModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        hotelModel.adress.split(',').first,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _adresLong(HotelModel hotelModel) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: const Alignment(-1, 0),
          textStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFF0D72FF),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
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
              style: const TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF828796),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
