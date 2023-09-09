import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/helpers/app_bar.dart';
import 'package:effective/model/rooms_model.dart';
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
    final block = context.read<AppBlock>();
    return BlocBuilder<AppBlock, AppState>(
      buildWhen: (previous, current) => current is GetRoomsState,
      builder: (context, state) {
        List<RoomsModel> listRooms =
            state is GetRoomsState ? state.listRooms : [];
        return Scaffold(
            appBar: appBar(context,
                block.repository.hotelModel?.adress.split(',').first ?? ''),
            body: state is StartState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      const SizedBox(height: 10),
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
