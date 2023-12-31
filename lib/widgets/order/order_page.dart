import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/helpers/app_bar.dart';
import 'package:effective/widgets/order/data_order.dart';
import 'package:effective/widgets/order/add_tourist.dart';
import 'package:effective/widgets/order/button_order.dart';
import 'package:effective/widgets/order/buyer_info.dart';
import 'package:effective/widgets/order/final_price.dart';
import 'package:effective/widgets/order/hotel_item.dart';
import 'package:effective/widgets/order/tourists/tourists_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomOrderWidget extends StatelessWidget {
  const RoomOrderWidget({super.key});

  static const String id = '/RoomOrderWidget';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlock, AppState>(
        buildWhen: (previous, current) => current is GetRoomState,
        builder: (context, state) => Scaffold(
              appBar: appBar(context, "Бронирование"),
              body: state is GetRoomState
                  ? ListView(children: [
                      const SizedBox(height: 8),
                      BlokHotel(roomModel: state.roomModel),
                      DataOrdersWidget(roomModel: state.roomModel),
                      const BuyerHotel(),
                      const TestTouristsWidget(),
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
