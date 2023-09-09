import 'package:effective/block/block.dart';
import 'package:effective/helpers/function_help.dart';
import 'package:effective/helpers/buttons_app.dart';
import 'package:effective/helpers/hotel_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonOrderWidget extends StatelessWidget {
  const ButtonOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();

    return Column(
      children: [
        ButtonsApp(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 48,
            circular: 14,
            backgroundColor: HotelTheme.buttonBackgroundColor,
            child: Text(
              'Оплатить ${spaceSeparateNumbers(block.repository.finalPrices.last.price)}',
              style: HotelTheme.textStyle16_500White,
            ),
            onPressed: () => block.hotelOrder(context)),
        const SizedBox(height: 10),
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(2.5))),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
