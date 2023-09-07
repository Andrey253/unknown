import 'package:effective/class_helpers/buttons_app.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:flutter/material.dart';

List<Widget> actionOk(BuildContext ctx) {
  return [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ButtonsApp(
          width: 150,
          height: 48,
          circular: 12,
          backgroundColor: HotelTheme.buttonBackgroundColor,
          child: const Text('Ok'),
          onPressed: () => Navigator.pop(ctx)),
    ),
  ];
}

String spaceSeparateNumbersHelp(dynamic s) => s.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');
