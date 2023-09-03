import 'package:flutter/material.dart';

class DropButtonFilter extends StatelessWidget {
  const DropButtonFilter({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final List<String> items;

  final void Function(String?)? onChanged;

  final String? value;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: width * 0.02, bottom: width * 0.035, right: width * 0.02),
      child: InputDecorator(
          decoration: InputDecoration(
            border: const OutlineInputBorder(gapPadding: 0),
            contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
          ),
          child: DropdownButton<String>(
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.037)),
                      ))
                  .toList(),
              onChanged: onChanged,
              value: value,
              isExpanded: true,
              underline: const SizedBox.shrink())),
    );
  }
}
