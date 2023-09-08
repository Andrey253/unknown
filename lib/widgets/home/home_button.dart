import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();
    return BlocBuilder<AppBlock, AppState>(
        builder: (context, state) => block.repository.hotelModel == null ||
                state is StartState
            ? const SizedBox.shrink()
            : Container(
                height: 88,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(12))),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 11, 88, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RoomsWidget.id);
                              block.getRooms();
                            },
                            child: const Text(
                              'К выбору номера',
                              style: HotelTheme.textStyle16_500White,
                            ),
                          ),
                        ),
                      ),
                    ),
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
              ));
  }
}
