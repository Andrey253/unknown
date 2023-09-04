import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => current is GetHotelState,
          builder: (context, state) => state is GetHotelState
              ? ListView(shrinkWrap: true, children: [
                  _rating(state),
                  _adresShort(state),
                  _adresLong(state),
                  _price(state),
                ])
              : const SizedBox.shrink()),
    );
  }

  Widget _rating(GetHotelState state) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
            color: Color(0x33FFC700),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFFFA800),
            ),
            if (state.hotelModel != null)
              Text(
                " ${state.hotelModel.rating} ${state.hotelModel.ratingName}",
                style: const TextStyle(
                    wordSpacing: 4,
                    overflow: TextOverflow.ellipsis,
                    color: Color(0xFFFFA800),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
          ],
        ),
      ),
    );
  }

  Widget _adresShort(GetHotelState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        state.hotelModel.adress.split(',').first,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _adresLong(GetHotelState state) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment(-1, 0),
          textStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFF0D72FF),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      onPressed: () {},
      child: Text(
        state.hotelModel.adress,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _price(GetHotelState state) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "от ${state.hotelModel.minimalPrice}",
            style: const TextStyle(
                textBaseline: TextBaseline.ideographic,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              state.hotelModel.priceForIt,
              style: const TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF828796),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
