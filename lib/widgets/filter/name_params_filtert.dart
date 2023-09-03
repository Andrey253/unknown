import 'package:flutter/material.dart';

class NameParamsFilterWidget extends StatelessWidget {
  const NameParamsFilterWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: width * 0.042));
  }
}
