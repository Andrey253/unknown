import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/home/home_button.dart';
import 'package:effective/widgets/home/home_one/home_one.dart';
import 'package:effective/widgets/home/home_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//flutter build apk --split-per-abi
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.backGround,
        body: ListView(
          children: const <Widget>[
            HomeOne(),
            SizedBox(height: 12),
            HomeTwo(),
            SizedBox(height: 12),
            HomeButton(),
          ],
        ),
      ),
    );
  }
}
