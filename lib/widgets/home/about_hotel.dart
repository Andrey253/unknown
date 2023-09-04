import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutHotelWidget extends StatelessWidget {
  const AboutHotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => current is GetHotelState,
          builder: (context, state) => state is GetHotelState
              ? ListView(shrinkWrap: true, children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Об отеле",
                      style: TextStyle(
                          wordSpacing: 4,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: state.hotelModel.aboutTheHotel.peculiarities
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                e,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xFF828796),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      state.hotelModel.aboutTheHotel.description,
                      maxLines: 10,
                      style: TextStyle(
                          wordSpacing: 4,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ])
              : const SizedBox.shrink()),
    );
  }
}
