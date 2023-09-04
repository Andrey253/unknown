 import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

AppBar appBar(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: Navigator.of(context).pop,
        icon: const SvgIcon(
            size: 14,
            color: Colors.black,
            icon: SvgIconData('assets/svg/toleft.svg')),
      ),
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }