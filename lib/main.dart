import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/repository/repository.dart';

import 'package:effective/widgets/end/end_widget.dart';
import 'package:effective/widgets/home/home_page.dart';
import 'package:effective/widgets/order/order_page.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'class_helpers/hotel_theme.dart';

//На Flutter 3.7.5 ExpansionPanel глючат
// flutter build apk --split-per-abi
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) =>
          HomeBloc(repository: Repository(), type: const StartState()),
      child: MaterialApp(
        theme: HotelTheme.buildLightThemeMy(),
        home: const HomePage(),
        routes: {
          '/rooms': (context) => const RoomsWidget(),
          '/RoomOrderWidget': (context) => const RoomOrderWidget(),
          '/EndWidget': (context) => const EndWidget(),
        },
      ),
    );
  }
}
