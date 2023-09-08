import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/widgets/home/home_one/custom_carousel.dart';
import 'package:effective/widgets/home/home_one/name_hotel.dart';
import 'package:effective/widgets/home/home_one/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOne extends StatelessWidget {
  const HomeOne({
    super.key,
  });
  // final List<String>? listImages;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        // buildWhen: (previous, current) => current is GetHotelState ||current is StartState,
        builder: (context, state) {
      final hotelModel = context.read<HomeBloc>().repository.hotelModel;
      return MyContainer(
        padding: 16.0,
        child: Column(
          children: [
            const NameHotel(),
            MyCustomCarousel(
                listImages: state is StartState ? null : hotelModel?.imageUrls),
            RatingWidget(hotelModel:state is StartState ? null : hotelModel)
          ],
        ),
      );
    });
  }
}
