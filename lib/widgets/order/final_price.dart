// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:flutter/material.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/model/room_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/home_block.dart';

class FinalPriceWidget extends StatelessWidget {
  const FinalPriceWidget(
      {super.key, required this.roomModel, required this.finalPrice});
  final RoomModel roomModel;
  final List<FinalPrice> finalPrice;
  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return MyContainer(
        child: Column(
            children: finalPrice
                .map((e) => _row(e, block.spaceSeparateNumbers(e.price)))
                .toList()));
  }

  Widget _row(FinalPrice data, String price) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(data.name, style: HotelTheme.textStyle16_400Grey),
          Text("$price ₽",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: data.type == 1
                      ? HotelTheme.buttonBackgroundColor
                      : Colors.black)),
        ]));
  }
}

class FinalPrice {
  String name;
  int price;
  int type;
  FinalPrice(
    this.name,
    this.price,
    this.type,
  );
}
