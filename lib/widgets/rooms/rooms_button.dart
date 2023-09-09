import 'package:effective/block/block.dart';
import 'package:effective/helpers/buttons_app.dart';
import 'package:effective/helpers/hotel_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsButton extends StatelessWidget {
  const RoomsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();
    return ButtonsApp(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 48,
        circular: 14,
        backgroundColor: HotelTheme.buttonBackgroundColor,
        child:
            const Text('Выбрать номер', style: HotelTheme.textStyle16_500White),
        onPressed: () => block.getRoomAndNavigate(context));
  }
}
