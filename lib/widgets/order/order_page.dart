import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/app_bar.dart';
import 'package:effective/class_helpers/data_order.dart';
import 'package:effective/widgets/order/add_tourist.dart';
import 'package:effective/widgets/order/button_order.dart';
import 'package:effective/widgets/order/buyer_info.dart';
import 'package:effective/widgets/order/final_price.dart';
import 'package:effective/widgets/order/hotel_item.dart';
import 'package:effective/widgets/order/tourists/tourists_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomOrderWidget extends StatelessWidget {
  const RoomOrderWidget({super.key});

  static const String id = '/RoomOrderWidget';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is GetRoomState,
        builder: (context, state) => Scaffold(
              appBar: appBar(context, "Бронирование"),
              body: state is GetRoomState
                  ? ListView(children: [
                      const SizedBox(height: 8),
                      BlokHotel(roomModel: state.roomModel),
                      DataOrdersWidget(roomModel: state.roomModel),
                      const BuyerHotel(),
                      const TouristsWidget(),
                      const AddTouristWidget(),
                      FinalPriceWidget(
                        roomModel: state.roomModel,
                        finalPrice: state.finalPrice,
                      ),
                      const ButtonOrderWidget()
                    ])
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }
}
