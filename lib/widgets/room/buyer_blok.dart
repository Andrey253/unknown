import 'package:effective/block/home_block.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHotel extends StatelessWidget {
  const BuyerHotel({super.key});

  // static const String id = '/RoomOrderWidget';
  // final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    // Text? prefix = Text('+7 (***) *** - ** - **');
    return MyContainer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Информация о покупателе',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black)),
      TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            // FilteringTextInputFormatter.allow(RegExp(r'^\+\d{11}$')),
          ],
          onChanged: (s) {
            print('teg s $s');
          },
          onTap: () {
            block.repository.phoneController.text = '(***) *** - ** - **';
            block.repository.phoneController.selection =
                TextSelection.fromPosition(TextPosition(offset: 0));
          },
          keyboardType: TextInputType.phone,
          controller: block.repository.phoneController,
          decoration: InputDecoration(
            prefixText: '+7',
            semanticCounterText: 'semanticCounterText',
            labelStyle: TextStyle(
              color: Color(0xFFA9ABB7),
            ),
            // hintText: "+7**********",

            labelText: 'Номер телефона',
            filled: true,
            fillColor: Color(0xFFF6F6F9),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFA9ABB7),
            )),
          )),
    ]));
  }
}
