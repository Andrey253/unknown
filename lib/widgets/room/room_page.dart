import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/app_bar.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/help/data_order.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/room/buyer_blok.dart';
import 'package:effective/widgets/room/hotel_blok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class RoomOrderWidget extends StatelessWidget {
  const RoomOrderWidget({super.key});

  static const String id = '/RoomOrderWidget';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is GetRoomState,
        builder: (context, state) => Scaffold(
              backgroundColor: ColorsConst.backGround,
              appBar: appBar(context, "Бронирование"),
              body: state is GetRoomState
                  ? ListView(children: [
                      BlokHotel(roomModel: state.roomModel),
                      DataOrdersWidget(roomModel: state.roomModel),BuyerHotel()
                    ])
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }
}
