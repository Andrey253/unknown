import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/app_bar.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/home/home_one/custom_carousel.dart';
import 'package:effective/widgets/rooms/rooms_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({
    super.key,
  });
  static const id = '/rooms';
  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is GetRoomsState,
      builder: (context, state) {
        List<RoomsModel> listRooms = state is GetRoomsState ? state.listRooms : [];
        return Scaffold(
            appBar: appBar(context, block.repository.hotelModel?.adress.split(',').first??''),
            backgroundColor: ColorsConst.backGround,
            body: state is StartState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: listRooms
                              .map((e) => RoomItemWidget(roomsModel: e))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.5))),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ));
      },
    );
  }
}
