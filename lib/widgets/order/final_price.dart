// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

import 'package:effective/block/home_block.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/model/room_model.dart';

class FinalPriceWidget extends StatelessWidget {
  const FinalPriceWidget(
      {super.key, required this.roomModel, required this.finalPrice});
  final RoomModel roomModel;
  final List<FinalPrice> finalPrice;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
        child: Column(children: finalPrice.map((e) => _row(e)).toList()));
  }

  Widget _row(FinalPrice data) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(data.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF828796))),
          Text(data.price.toString() + " ₽",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color:
                      data.type == 1 ? const Color(0xFF0D72FF) : Colors.black)),
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
