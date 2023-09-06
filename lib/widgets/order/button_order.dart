import 'package:effective/block/home_block.dart';
import 'package:effective/class_helpers/buttons_app.dart';
import 'package:effective/class_helpers/my_container_button.dart';
import 'package:effective/widgets/end/end_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonOrderWidget extends StatelessWidget {
  const ButtonOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();

    return MyContainerButton(
      child: Column(
        children: [
          ButtonsApp(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 48,
              circular: 14,
              backgroundColor: Color(0xFF0D72FF),
              child: const Text(
                'К выбору номера',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: ()=>block.hotelOrder(context)),
          const SizedBox(height: 10),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(2.5))),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
