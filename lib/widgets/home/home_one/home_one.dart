import 'package:effective/widgets/home/home_one/custom_carousel.dart';
import 'package:effective/widgets/home/home_one/name_hotel.dart';
import 'package:effective/widgets/home/home_one/rating.dart';
import 'package:flutter/material.dart';

class HomeOne extends StatelessWidget {
  const HomeOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(12))),
      child: Column(
        children: const [
          NameHotel(),
          MyCustomCarousel(),
          RatingWidget()
        ],
      ),
    );
  }
}