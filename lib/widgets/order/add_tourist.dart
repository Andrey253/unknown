import 'package:effective/block/home_block.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class AddTouristWidget extends StatelessWidget {
  const AddTouristWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return MyContainer(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 12),
        child: Text('Добавить туриста',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black)),
      ),
      IconButton(
        onPressed: block.addTourist,
    
        icon: const Icon(
          Icons.add_box,
          color: Color(0xFF0D72FF),
          size: 36,
        ),
      )
    ]));
  }
}