import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/carousel_details.dart';
import 'package:effective/widgets/details/loading.dart';
import 'package:effective/widgets/details/perfomance/perfomance.dart';
import 'package:effective/widgets/details/top_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsHome extends StatelessWidget {
  const DetailsHome({super.key, required this.repository, required this.url});

  final Repository repository;
  
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
        create: (_) => DetailsBloc(
            urlDetails: url,
            type: const GetingDetailsState(),
            repository: repository),
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const TopDetails(),
                shadowColor: Colors.transparent,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: ColorsConst.backGround,
              body: ListView(
                  children: const [CarouselWidget(), Perfomance(), Loading()])),
        ));
  }
}
