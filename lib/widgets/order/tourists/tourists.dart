import 'package:effective/widgets/order/tourists/expansion_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TouristWidget extends StatelessWidget {
  const TouristWidget({super.key, required this.expansionPanelData});
  final ExpansionPanelData expansionPanelData;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: expansionPanelData.inputField
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextField(
                    onChanged: onChanged,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.phone,
                    controller: e.textEditingController,
                    decoration: InputDecoration(
                      errorText: e.error,
                      errorStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xFF828796),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      labelText: e.nameField,
                      filled: true,
                      fillColor: const Color(0xFFF6F6F9),
                      border: const OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Color(0xFFA9ABB7),
                          )),
                    )),
              ),
            )
            .toList());
  }

  void onChanged(String value) {}
}
