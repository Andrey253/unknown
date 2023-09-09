import 'package:flutter/material.dart';

class HotelTheme {
  static const scaffoldBackgroundColor = Color(0xFFF6F6F9);
  static const buttonBackgroundColor = Color(0xFF0D72FF);
  static const textRaitingColor = Color(0xFFFFA800);
  static const greyColor = Color(0xFFA9ABB7);
  static const errorColor = Color(0x26EB5757);
  static const labelMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);
  static const blueAdress = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0xFF0D72FF),
      fontSize: 14,
      fontWeight: FontWeight.w500);
  static const textStyle16_400Grey = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0xFF828796),
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static const textStyle16_500Grey = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0xFF828796),
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static const textStyle16_500Black = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static const textStyle16_500White = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static const textStyle22_500Black = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w500);
  static const textStyle16_400Black = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400);
  static const textStyle14_500Grey = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0xFF828796),
      fontSize: 14,
      fontWeight: FontWeight.w500);
  static const textStyle14_400Grey = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0xFF828796),
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static const textStyleRaiting = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: HotelTheme.textRaitingColor,
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static ThemeData buildLightThemeMy() => ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      fontFamily: 'SFProDisplay',
      textTheme: const TextTheme(labelMedium: labelMedium));

  
}
