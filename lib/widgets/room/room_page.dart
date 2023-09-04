import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/app_bar.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/source/consts.dart';
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
                      MyContainer(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            _rating(state.roomModel),
                            _adresShort(state.roomModel),
                            _adresLong(state.roomModel),
                          ]))
                    ])
                  : const SizedBox.shrink(),
            ));
  }

 

  Widget _rating(RoomModel hotelModel) {
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
            Text(
              " ${hotelModel.horating} ${hotelModel.ratingName}",
              style: const TextStyle(
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

  Widget _adresShort(RoomModel hotelModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        hotelModel.hotelAdress.split(',').first,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _adresLong(RoomModel hotelModel) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: const Alignment(-1, 0),
          textStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFF0D72FF),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      onPressed: () {},
      child: Text(
        hotelModel.hotelAdress,
        textAlign: TextAlign.start,
      ),
    );
  }
}
