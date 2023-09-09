import 'package:effective/block/block.dart';
import 'package:effective/helpers/app_bar.dart';
import 'package:effective/helpers/buttons_app.dart';
import 'package:effective/helpers/hotel_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishWidget extends StatelessWidget {
  const FinishWidget({super.key});
  static const id = '/EndWidget';

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, 'Заказ оплачен'),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      padding: const EdgeInsets.all(23),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF6F6F9)),
                      child: Image.asset('assets/images/end.png'),
                    ),
                  ),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: HotelTheme.textStyle22_500Black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Text(
                      'Подтверждение заказа №${block.repository.orderNumber} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                      style: HotelTheme.textStyle16_400Grey,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonsApp(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 48,
              circular: 14,
              backgroundColor: HotelTheme.buttonBackgroundColor,
              child: const Text(
                'Супер!',
                style: HotelTheme.textStyle16_500White,
              ),
              onPressed: () => block.finish(context)),
          const SizedBox(height: 14),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(2.5))),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
