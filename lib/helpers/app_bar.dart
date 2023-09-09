import 'package:effective/helpers/hotel_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

AppBar appBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.zero,
      onPressed: Navigator.of(context).pop,
      icon: const SvgIcon(
          size: 14,
          color: Colors.black,
          icon: SvgIconData('assets/svg/toleft.svg')),
    ),
    backgroundColor: Colors.white,
    title: Align(
      alignment: const Alignment(-0.25, 1),
      child: Text(
        title,
        style: HotelTheme.labelMedium,
      ),
    ),
  );
}
