import 'package:flutter/material.dart';

class NameHotel extends StatelessWidget {
  const NameHotel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text('Отель',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black)),
      ),
    );
  }
}
