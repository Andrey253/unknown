import 'package:flutter/cupertino.dart';

class TextWS extends StatelessWidget {
  const TextWS(
      {super.key,
      required this.text,
      required this.width,
      required this.size,
      required this.fontWeight, required this.color});
  final String text;
  final double width;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: fontWeight, fontSize: width / 414 * size,color: color),
    );
  }
}
