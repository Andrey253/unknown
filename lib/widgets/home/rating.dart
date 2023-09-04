import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final block = context.read<HomeBloc>();
    PageController pageController = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment(-1, 0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // height: size.width * 0.15,
          // width: size.width * 0.5,
          decoration: const BoxDecoration(
              color: Color(0x33FFC700),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          clipBehavior: Clip.hardEdge,
          child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is GetHotelState,
              builder: (context, state) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFA800),
                      ),
                      if (block.repository.hotelModel != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            block.repository.hotelModel!.rating.toString() +
                                " " +
                                block.repository.hotelModel!.ratingName
                                    .toString(),
                            style: TextStyle(
                                color: Color(0xFFFFA800),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                    ],
                  )),
        ),
      ),
    );
  }
}
