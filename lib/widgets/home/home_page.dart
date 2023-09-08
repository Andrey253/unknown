import 'package:effective/widgets/home/home_button.dart';
import 'package:effective/widgets/home/first_blok/first_blok.dart';
import 'package:effective/widgets/home/hotel_about_widget.dart';
import 'package:flutter/material.dart';

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
        body: ListView(
          children: const <Widget>[
            HomeOne(),
            HomeTwo(),
            HomeButton(),
          ],
        ),
      ),
    );
  }
}
