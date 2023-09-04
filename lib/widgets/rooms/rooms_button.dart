import 'package:effective/block/home_block.dart';
import 'package:effective/widgets/room/room_page.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsButton extends StatelessWidget {
  const RoomsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return Container(
      height: 88,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(34))),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 11, 88, 255),
                  //TODO Цвет в фигме не определяется
                  //TODO переделать на кнопку
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoomOrderWidget.id);
                    block.getRoom();
                  },
                  child: const Text(
                    'Выбрать номер',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
