import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/helpers/container_circle_border.dart';
import 'package:effective/widgets/home/first_blok/custom_carousel.dart';
import 'package:effective/widgets/home/first_blok/name_hotel.dart';
import 'package:effective/widgets/home/first_blok/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOne extends StatelessWidget {
  const HomeOne({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlock, AppState>(builder: (context, state) {
      final hotelModel = context.read<AppBlock>().repository.hotelModel;
      return MyContainer(
        padding: 16.0,
        child: Column(
          children: [
            const NameHotel(),
            MyCustomCarousel(
                listImages: state is StartState ? null : hotelModel?.imageUrls),
            RatingWidget(hotelModel: state is StartState ? null : hotelModel)
          ],
        ),
      );
    });
  }
}
