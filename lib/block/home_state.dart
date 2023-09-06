// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:effective/widgets/order/tourists/expansion_class.dart';
import 'package:equatable/equatable.dart';

import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/old_model/category.dart';
import 'package:effective/old_model/store/store.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class StartState extends HomeState {
  const StartState();

  @override
  List<Object> get props => [];
}

class UpdateStoreState extends HomeState {
  final Store store;
  const UpdateStoreState({required this.store});

  @override
  List<Object> get props => [store];
}

class AddTouristState extends HomeState {
  const AddTouristState({required this.created, required this.touristsData});
  final bool created;
  final List<ExpansionPanelData> touristsData;
  @override
  List<Object> get props => [created];
}

class ChangeExpandedtState extends HomeState {
  final int index;
  final bool isExp;
  const ChangeExpandedtState({
    required this.index,
    required this.isExp,
  });

  @override
  List<Object> get props => [index, isExp];
}

class GetRoomsState extends HomeState {
  const GetRoomsState({
    required this.listRooms,
  });
  final List<RoomsModel> listRooms;
  @override
  List<Object> get props => [listRooms];
}

class GetRoomState extends HomeState {
  const GetRoomState({
    required this.roomModel,
  });
  final RoomModel roomModel;
  @override
  List<Object> get props => [roomModel];
}

class GetHotelState extends HomeState {
  final HotelModel hotelModel;
  const GetHotelState({
    required this.hotelModel,
  });

  @override
  List<Object> get props => [hotelModel];
}
