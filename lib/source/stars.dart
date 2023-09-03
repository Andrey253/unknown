import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.raiting});
  final double raiting;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
        value: raiting,
        starBuilder: (index, color) => Icon(Icons.star, color: color),
        starCount: 5,
        starSize: MediaQuery.of(context).size.width * 0.05,
        maxValue: 5,
        starSpacing: 20,
        valueLabelVisibility: false,
        starColor: ColorsConst.star);
  }
}

