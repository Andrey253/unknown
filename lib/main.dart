import 'dart:async';

import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';

import 'package:effective/repository/repository_implementation.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/flash/flash.dart';
import 'package:effective/widgets/home/best_seller/best_seller.dart';
import 'package:effective/widgets/home/botom_sheet.dart';
import 'package:effective/widgets/home/categories.dart';
import 'package:effective/widgets/home/hot_sales.dart';
import 'package:effective/widgets/home/search_field.dart';
import 'package:effective/widgets/line/filter_line.dart';
import 'package:effective/widgets/line/best_saller.dart';
import 'package:effective/widgets/line/hot_sales.dart';
import 'package:effective/widgets/line/select_category.dart';
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
        title: 'Home',
        theme: ThemeData(fontFamily: markPro),
        home: BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(repository: RepositoryImplementation(), type: const StartState()),
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
  bool splash = true;
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), (() => setState(() => splash = false)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: ColorsConst.backGround,
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    FilterLine(),
                    SelectCategoryLine(),
                    CategoryesWidget(),
                    SearchField(),
                    HotSalesLine(),
                    HotSales(),
                    BestSellerLine(),
                    BestSellerWidget(),
                  ],
                ),
              ),
              const BottonSheet()
            ],
          ),
        ),
          Flash(splash: splash),
        
      ]),
    );
  }
}
