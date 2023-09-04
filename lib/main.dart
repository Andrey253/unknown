import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/home/home_page.dart';
import 'package:effective/widgets/room/room_page.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        theme: ThemeData(fontFamily: markPro),
        home: const HomePage(),
        routes: {
          '/rooms': (context) => RoomsWidget(),
          '/RoomOrderWidget': (context) => RoomOrderWidget(),
        },
      ),
    );
  }
}
