import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/container_circle_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTouristWidget extends StatelessWidget {
  const AddTouristWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();
    return MyContainer(
        padding: 6.0,
        child: BlocBuilder<AppBlock, AppState>(
            buildWhen: (previous, current) => current is TouristState,
            builder: (context, state) => block.repository.touristsData.length >
                    block.repository.maxTourists
                ? Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 18),
                    child: Text(
                        'Максимум ${block.repository.maxTourists + 1} туристов',
                        textAlign: TextAlign.center,
                        style: HotelTheme.textStyle22_500Black),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 14.0, bottom: 18, left: 10),
                          child: Text('Добавить туриста',
                              style: HotelTheme.textStyle22_500Black),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => block.addTourist(context),
                          icon: const Icon(
                            Icons.add_box,
                            color: Color(0xFF0D72FF),
                            size: 40,
                          ),
                        )
                      ])));
  }
}
