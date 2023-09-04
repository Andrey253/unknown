import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/home/name_hotel.dart';
import 'package:effective/widgets/home/custom_carousel.dart';
import 'package:effective/widgets/home/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: markPro),
        home: BlocProvider<HomeBloc>(
          create: (_) =>
              HomeBloc(repository: Repository(), type: const StartState()),
          child: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//flutter build apk --split-per-abi
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.backGround,
        body: ListView(
          children: const <Widget>[
            NameHotel(),
            // HotSales(),
            MyCustomCarousel(),
            RatingWidget()
          ],
        ),
      ),
    );
  }
}
