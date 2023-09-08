import 'package:effective/block/block.dart';
import 'package:effective/repository/repository.dart';

import 'package:effective/widgets/finish_widget/finish_widget.dart';
import 'package:effective/widgets/home/home_page.dart';
import 'package:effective/widgets/order/order_page.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'class_helpers/hotel_theme.dart';

// flutter build apk --split-per-abi
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBlock>(
      create: (_) => AppBlock(repository: Repository()),
      child: MaterialApp(
        theme: HotelTheme.buildLightThemeMy(),
        // home: const HomePage(),
        routes: {
          '/rooms': (context) => const RoomsWidget(),
          '/RoomOrderWidget': (context) => const RoomOrderWidget(),
          '/EndWidget': (context) => const FinishWidget(),
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
